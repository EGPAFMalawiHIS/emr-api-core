# frozen_string_literal: true

# Model: Drug
class Drug < ApplicationRecord
  self.table_name = 'drug'
  self.primary_key = 'drug_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
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
