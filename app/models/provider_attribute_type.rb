# frozen_string_literal: true

# Model: ProviderAttributeType
class ProviderAttributeType < ApplicationRecord
  self.table_name = 'provider_attribute_type'
  self.primary_key = 'provider_attribute_type_id'

  has_many :provider_attribute, foreign_key: attribute_type_id, primary_key: provider_attribute_type_id
  validates :name, presence: true
  validates :min_occurs, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
