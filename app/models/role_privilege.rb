# frozen_string_literal: true

# Model: RolePrivilege
class RolePrivilege < ApplicationRecord
  self.table_name = 'role_privilege'
  self.primary_key = '["privilege", "role"]'

  validates :role, presence: true
  validates :privilege, presence: true
end
