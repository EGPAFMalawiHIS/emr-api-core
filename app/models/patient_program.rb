# frozen_string_literal: true

# Model: PatientProgram
class PatientProgram < ApplicationRecord
  self.table_name = 'patient_program'
  self.primary_key = 'patient_program_id'

  has_many :patient_program_attribute, foreign_key: patient_program_id, primary_key: patient_program_id
  has_many :patient_state, foreign_key: patient_program_id, primary_key: patient_program_id
  validates :patient_id, presence: true
  validates :program_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
