# frozen_string_literal: true

# Model: Drug
class Drug < ApplicationRecord
  self.table_name = 'drug'
  self.primary_key = 'drug_id'

  has_many :concept_answer, foreign_key: answer_drug, primary_key: drug_id
  has_many :drug_ingredient, foreign_key: drug_id, primary_key: drug_id
  has_many :drug_order, foreign_key: drug_inventory_id, primary_key: drug_id
  has_many :drug_reference_map, foreign_key: drug_id, primary_key: drug_id
  has_many :obs, foreign_key: value_drug, primary_key: drug_id
  validates :concept_id, presence: true
  validates :combination, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
