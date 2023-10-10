# frozen_string_literal: true

# Model: Condition
class Condition < ApplicationRecord
  self.table_name = 'conditions'
  self.primary_key = 'condition_id'

  has_many :conditions, foreign_key: previous_version, primary_key: condition_id
  has_many :encounter_diagnosis, foreign_key: condition_id, primary_key: condition_id
  validates :clinical_status, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :creator, presence: true
  validates :patient_id, presence: true
end
