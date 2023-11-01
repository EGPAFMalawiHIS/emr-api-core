# frozen_string_literal: true

# Model: PatientProgram
class PatientProgram < VoidableRecord
  self.table_name = 'patient_program'
  self.primary_key = 'patient_program_id'

  belongs_to :patient
  belongs_to :program

  has_many :patient_program_attribute, foreign_key: patient_program_id, primary_key: patient_program_id
  has_many :patient_state, foreign_key: patient_program_id, primary_key: patient_program_id
  
  validates :patient_id, :program_id, presence: true
end
