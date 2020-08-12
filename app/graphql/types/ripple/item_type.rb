# frozen_string_literal: true

module Types
  module Ripple
    class ItemType < Types::BaseUnion
      description 'Objects which may be linked to events'
      possible_types Types::Ripple::AssetTypeType, Types::Ripple::AssetType, Types::Ripple::RowItemType

      def self.resolve_type(object, _context)
        if object.class.name == 'AssetType'
          Types::Ripple::AssetTypeType
        elsif object.class.name == 'Asset'
          Types::Ripple::AssetType
        elsif object.class.name == 'RowItem'
          Types::Ripple::RowItemType
        end
      end
    end
  end
end
