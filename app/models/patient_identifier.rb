# frozen_string_literal: true

# Model: PatientIdentifier
class PatientIdentifier < VoidableRecord
  self.table_name = 'patient_identifier'
  self.primary_key = 'patient_identifier_id'

  belongs_to :patient
  has_one :identifier_type, class_name: 'PatientIdentifierType', foreign_key: :identifier_type_id, primary_key: :patient_identifier_type_id

  validates :patient_id, :identifier, :identifier_type, :preferred, presence: true
end
