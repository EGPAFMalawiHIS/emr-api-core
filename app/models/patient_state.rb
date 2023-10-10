# frozen_string_literal: true

# Model: PatientState
class PatientState < ApplicationRecord
  self.table_name = 'patient_state'
  self.primary_key = 'patient_state_id'

  validates :patient_program_id, presence: true
  validates :state, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
