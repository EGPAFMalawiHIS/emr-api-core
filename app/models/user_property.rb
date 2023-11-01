# frozen_string_literal: true

# Model: UserProperty
class UserProperty < ApplicationRecord
  self.table_name = 'user_property'
  self.primary_key = '["user_id", "property"]'

  validates :user_id, presence: true
  validates :property, presence: true
  validates :property_value, presence: true
end
