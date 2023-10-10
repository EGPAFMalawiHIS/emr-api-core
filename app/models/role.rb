# frozen_string_literal: true

# Model: Role
class Role < ApplicationRecord
  self.table_name = 'role'
  self.primary_key = 'role'

  has_many :role_privilege, foreign_key: role, primary_key: role
  has_many :role_role, foreign_key: child_role, primary_key: role
  has_many :role_role, foreign_key: parent_role, primary_key: role
  has_many :user_role, foreign_key: role, primary_key: role
  validates :uuid, presence: true
end
