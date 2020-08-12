# frozen_string_literal: true

module Mutations
  module Images
    class Create < AuthorizedMutation
      include Helpers::Create

      argument :blob_id, ID, required: true
      argument :asset_type_id, ID, required: true

      field :image, Types::Ripple::ImageType, null: false

      def resolve(blob_id:, asset_type_id:)
        asset_type = AssetType.find_by!(company_id: context[:company_id], id: asset_type_id)

        image = Image.create!(company_id: context[:company_id])

        create_attachment(image.id, blob_id)

        ResourceImage.create!(company_id: context[:company_id], resource: asset_type, image: image)

        { image: image }
      end

      def create_attachment(image_id, blob_id)
        ActiveStorage::Attachment.create(
          name: 'file',
          record_type: 'Image',
          record_id: image_id,
          blob_id: blob_id
        )
      end
    end
  end
end
