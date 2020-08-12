# frozen_string_literal: true

module Mutations
  module Images
    class Upload < AuthorizedMutation
      argument :asset_type_id, ID, required: true
      argument :content_type, String, required: true
      argument :byte_size, Integer, required: true
      argument :checksum, String, required: true

      field :blob, Types::Ripple::BlobType, null: false

      def resolve(asset_type_id:, content_type:, byte_size:, checksum:)
        validate_file_type!(content_type)

        asset_type = AssetType.find_by!(company_id: context[:company_id], id: asset_type_id)
        filename = "#{asset_type.name} #{asset_type.images.count + 1}.#{file_types[content_type]}"
        filename = filename.gsub(' ', '_')

        pp filename

        blob = ActiveStorage::Blob.create_before_direct_upload!(
          filename: filename,
          byte_size: byte_size,
          checksum: checksum,
          content_type: content_type
        )

        { blob: {
          id: blob.id,
          service_url: blob.service_url_for_direct_upload,
          headers: blob.service_headers_for_direct_upload.map { |k, v| "#{k}: #{v}" }
        } }
      end

      def validate_file_type!(file_type)
        types = file_types.keys

        msg = "Allowed file extensions are #{types}"
        raise GraphQL::ExecutionError, msg unless types.include? file_type
      end

      def file_types
        {
          'image/jpeg' => :jpeg,
          'image/png' => :png,
          'image/bmp' => :bmp
        }
      end
    end
  end
end
