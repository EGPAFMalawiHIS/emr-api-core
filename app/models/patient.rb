# frozen_string_literal: true

# Model: Patient
class Patient < ApplicationRecord
  self.table_name = 'patient'
  self.primary_key = 'patient_id'

  has_many :allergy, foreign_key: patient_id, primary_key: patient_id
  has_many :cohort_member, foreign_key: patient_id, primary_key: patient_id
  has_many :conditions, foreign_key: patient_id, primary_key: patient_id
  has_many :encounter, foreign_key: patient_id, primary_key: patient_id
  has_many :encounter_diagnosis, foreign_key: patient_id, primary_key: patient_id
  has_many :encounter_diagnosis, foreign_key: patient_id, primary_key: patient_id
  has_many :note, foreign_key: patient_id, primary_key: patient_id
  has_many :order_group, foreign_key: patient_id, primary_key: patient_id
  has_many :orders, foreign_key: patient_id, primary_key: patient_id
  has_many :patient_identifier, foreign_key: patient_id, primary_key: patient_id
  has_many :patient_identifier, foreign_key: patient_id, primary_key: patient_id
  has_many :patient_program, foreign_key: patient_id, primary_key: patient_id
  has_many :visit, foreign_key: patient_id, primary_key: patient_id
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :allergy_status, presence: true
end
