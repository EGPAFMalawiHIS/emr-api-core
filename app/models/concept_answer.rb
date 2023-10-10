# frozen_string_literal: true

# Model: ConceptAnswer
class ConceptAnswer < ApplicationRecord
  self.table_name = 'concept_answer'
  self.primary_key = 'concept_answer_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  belongs_to :answer, class_name: 'Concept', foreign_key: :answer_concept, primary_key: :concept_id, optional: true
  belongs_to :drug, foreign_key: :answer_drug, primary_key: :drug_id, optional: true

  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
