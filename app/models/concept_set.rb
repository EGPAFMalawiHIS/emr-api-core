# frozen_string_literal: true

# Model: ConceptSet
class ConceptSet < ApplicationRecord
  self.table_name = 'concept_set'
  self.primary_key = 'concept_set_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  belongs_to :set, class_name: 'Concept', foreign_key: :concept_set, primary_key: :concept_id, optional: true

  validates :concept_id, presence: true
  validates :concept_set, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
