# frozen_string_literal: true

# Model: EncounterRole
class EncounterRole < ApplicationRecord
  self.table_name = 'encounter_role'
  self.primary_key = 'encounter_role_id'

  has_many :encounter_provider, foreign_key: encounter_role_id, primary_key: encounter_role_id
  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
