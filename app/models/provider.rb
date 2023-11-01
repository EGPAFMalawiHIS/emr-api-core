# frozen_string_literal: true

# Model: Provider
class Provider < RetirableRecord
  self.table_name = 'provider'
  self.primary_key = 'provider_id'

  has_many :encounter_provider, foreign_key: provider_id, primary_key: provider_id
  has_many :orders, foreign_key: orderer, primary_key: provider_id
  has_many :provider_attribute, foreign_key: provider_id, primary_key: provider_id
end
