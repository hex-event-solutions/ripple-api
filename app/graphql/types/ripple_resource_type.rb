# frozen_string_literal: true

module Types
  class RippleResourceType < Types::BaseUnion
    description 'Objects which may be linked to images'
    possible_types Types::RippleAssetTypeType, Types::RippleCategoryType

    def self.resolve_type(object, _context)
      if object.class.name == 'AssetType'
        Types::RippleAssetTypeType
      elsif object.class.name == 'Category'
        Types::RippleCategoryType
      end
    end
  end
end
