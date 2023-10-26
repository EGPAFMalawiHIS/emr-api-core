# frozen_string_literal: true

# Model: PatientIdentifierType
class PatientIdentifierType < ApplicationRecord
  self.table_name = 'patient_identifier_type'
  self.primary_key = 'patient_identifier_type_id'

  has_many :patient_identifier, foreign_key: :identifier_type, primary_key: :patient_identifier_type_id

end
