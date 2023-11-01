# frozen_string_literal: true

# Model: PatientProgramAttribute
class PatientProgramAttribute < VoidableRecord
  self.table_name = 'patient_program_attribute'
  self.primary_key = 'patient_program_attribute_id'

  belongs_to :patient_program
  has_one :attribute_type, foreign_key: :attribute_type_id, primary_key: :patient_program_attribute_id

  validates :patient_program_id, :attribute_type_id, :value_reference, presence: true
end
