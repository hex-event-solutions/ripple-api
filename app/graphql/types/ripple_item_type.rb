# frozen_string_literal: true

module Types
  class RippleItemType < Types::BaseUnion
    description 'Objects which may be linked to document items'
    possible_types Types::RippleAssetTypeType, Types::RippleRowItemType

    def self.resolve_type(object, _context)
      if object.class.name == 'AssetType'
        Types::RippleAssetTypeType
      elsif object.class.name == 'RowItem'
        Types::RippleRowItemType
      end
    end
  end
end