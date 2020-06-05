# frozen_string_literal: true

class RolePrivilege < ApplicationRecord
  belongs_to :role

  validates :role, :action, :resource, presence: true
end
