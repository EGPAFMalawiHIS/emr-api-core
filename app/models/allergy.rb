# frozen_string_literal: true

# Model: Allergy
class Allergy < ApplicationRecord
  self.table_name = 'allergy'
  self.primary_key = 'allergy_id'

  belongs_to :patient, foreign_key: :patient_id, primary_key: :patient_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :coded_allergen, primary_key: :concept_id, optional: true
  belongs_to :allergy_type, foreign_key: :allergen_type, primary_key: :concept_id, optional: true

  has_many :allergy_reaction, foreign_key: allergy_id, primary_key: allergy_id

  validates :patient_id, presence: true
  validates :coded_allergen, presence: true
  validates :allergen_type, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
