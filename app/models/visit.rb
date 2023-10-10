# frozen_string_literal: true

# Model: Visit
class Visit < ApplicationRecord
  self.table_name = 'visit'
  self.primary_key = 'visit_id'

  has_many :encounter, foreign_key: visit_id, primary_key: visit_id
  has_many :visit_attribute, foreign_key: visit_id, primary_key: visit_id
  validates :patient_id, presence: true
  validates :visit_type_id, presence: true
  validates :date_started, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
