# frozen_string_literal: true

# Model: Encounter
class Encounter < ApplicationRecord
  self.table_name = 'encounter'
  self.primary_key = 'encounter_id'

  has_many :concept_proposal, foreign_key: encounter_id, primary_key: encounter_id
  has_many :encounter_diagnosis, foreign_key: encounter_id, primary_key: encounter_id
  has_many :encounter_provider, foreign_key: encounter_id, primary_key: encounter_id
  has_many :note, foreign_key: encounter_id, primary_key: encounter_id
  has_many :obs, foreign_key: encounter_id, primary_key: encounter_id
  has_many :order_group, foreign_key: encounter_id, primary_key: encounter_id
  has_many :orders, foreign_key: encounter_id, primary_key: encounter_id
  validates :encounter_type, presence: true
  validates :patient_id, presence: true
  validates :encounter_datetime, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
