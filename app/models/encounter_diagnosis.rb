# frozen_string_literal: true

# Model: EncounterDiagnosis
class EncounterDiagnosis < ApplicationRecord
  self.table_name = 'encounter_diagnosis'
  self.primary_key = 'diagnosis_id'

  validates :encounter_id, presence: true
  validates :patient_id, presence: true
  validates :certainty, presence: true
  validates :rank, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
