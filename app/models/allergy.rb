# frozen_string_literal: true

# Model: Allergy
class Allergy < ApplicationRecord
  self.table_name = 'allergy'
  self.primary_key = 'allergy_id'

  has_many :allergy_reaction, foreign_key: allergy_id, primary_key: allergy_id
  validates :patient_id, presence: true
  validates :coded_allergen, presence: true
  validates :allergen_type, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
