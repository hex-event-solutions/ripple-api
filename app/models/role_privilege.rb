# frozen_string_literal: true

class RolePrivilege < ApplicationRecord
  belongs_to :company
  belongs_to :role

  validates :company, :role, :action, :resource, presence: true
end
