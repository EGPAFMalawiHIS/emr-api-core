# frozen_string_literal: true

# Model: PatientState
class PatientState < VoidableRecord
  self.table_name = 'patient_state'
  self.primary_key = 'patient_state_id'

  belongs_to :patient_program

  validates :patient_program_id, :state, presence: true
end
