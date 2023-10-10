# frozen_string_literal: true

# Model: PatientIdentifier
class PatientIdentifier < ApplicationRecord
  self.table_name = 'patient_identifier'
  self.primary_key = 'patient_identifier_id'

  validates :patient_id, presence: true
  validates :identifier, presence: true
  validates :identifier_type, presence: true
  validates :preferred, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
