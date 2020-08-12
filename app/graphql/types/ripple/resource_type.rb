# frozen_string_literal: true

module Types
  module Ripple
    class ResourceType < Types::BaseUnion
      description 'Objects which may be linked to images'
      possible_types Types::Ripple::AssetTypeType, Types::Ripple::CategoryType

      def self.resolve_type(object, _context)
        if object.class.name == 'AssetType'
          Types::Ripple::AssetTypeType
        elsif object.class.name == 'Category'
          Types::Ripple::CategoryType
        end
      end
    end
  end
end
