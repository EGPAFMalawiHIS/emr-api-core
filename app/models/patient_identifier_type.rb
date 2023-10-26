# frozen_string_literal: true

# Model: PatientIdentifierType
class PatientIdentifierType < VoidableRecord
  self.table_name = 'patient_identifier_type'
  self.primary_key = 'patient_identifier_type_id'

  has_many :patient_identifier, foreign_key: identifier_type, primary_key: patient_identifier_type_id
  
  validates :name, :check_digit, presence: true
end
