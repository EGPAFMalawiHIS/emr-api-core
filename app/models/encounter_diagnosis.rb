# frozen_string_literal: true

# Model: EncounterDiagnosis
class EncounterDiagnosis < ApplicationRecord
  self.table_name = 'encounter_diagnosis'
  self.primary_key = 'diagnosis_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true
  belongs_to :encounter, foreign_key: :encounter_id, primary_key: :encounter_id, optional: true
  belongs_to :patient, foreign_key: :patient_id, primary_key: :patient_id, optional: true

  validates :encounter_id, presence: true
  validates :patient_id, presence: true
  validates :certainty, presence: true
  validates :rank, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
