# frozen_string_literal: true

# Model: ConceptAnswer
class ConceptAnswer < ApplicationRecord
  self.table_name = 'concept_answer'
  self.primary_key = 'concept_answer_id'

  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
