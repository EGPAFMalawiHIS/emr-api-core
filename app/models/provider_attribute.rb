# frozen_string_literal: true

# Model: ProviderAttribute
class ProviderAttribute < ApplicationRecord
  self.table_name = 'provider_attribute'
  self.primary_key = 'provider_attribute_id'

  validates :provider_id, presence: true
  validates :attribute_type_id, presence: true
  validates :value_reference, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
