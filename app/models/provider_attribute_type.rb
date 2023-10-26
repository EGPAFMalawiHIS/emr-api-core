# frozen_string_literal: true

# Model: ProviderAttributeType
class ProviderAttributeType < ApplicationRecord
  self.table_name = 'provider_attribute_type'
  self.primary_key = 'provider_attribute_type_id'

  has_many :provider_attribute, foreign_key: attribute_type_id, primary_key: provider_attribute_type_id
  validates :name, :min_occurs, presence: true
end
