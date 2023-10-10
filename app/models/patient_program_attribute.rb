# frozen_string_literal: true

# Model: PatientProgramAttribute
class PatientProgramAttribute < ApplicationRecord
  self.table_name = 'patient_program_attribute'
  self.primary_key = 'patient_program_attribute_id'

  validates :patient_program_id, presence: true
  validates :attribute_type_id, presence: true
  validates :value_reference, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
