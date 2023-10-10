# frozen_string_literal: true

# Model: UserRole
class UserRole < ApplicationRecord
  self.table_name = 'user_role'
  self.primary_key = '["role", "user_id"]'

  validates :user_id, presence: true
  validates :role, presence: true
end
