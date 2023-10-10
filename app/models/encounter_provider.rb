# frozen_string_literal: true

# Model: EncounterProvider
class EncounterProvider < ApplicationRecord
  self.table_name = 'encounter_provider'
  self.primary_key = 'encounter_provider_id'

  validates :encounter_id, presence: true
  validates :provider_id, presence: true
  validates :encounter_role_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
