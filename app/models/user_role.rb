# frozen_string_literal: true

# Model: UserRole
class UserRole < ApplicationRecord
  self.table_name = 'user_role'
  self.primary_key = 'user_id'
  self.primary_key = 'role'

  belongs_to :user, foreign_key: :user_id
  belongs_to :role, foreign_key: :role

  validates :user, :role, presence: true
end
