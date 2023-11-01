# frozen_string_literal: true

# Model: RoleRole
class RoleRole < ApplicationRecord
  self.table_name = 'role_role'
  self.primary_key = '["parent_role", "child_role"]'

  validates :parent_role, presence: true
  validates :child_role, presence: true
end
