# frozen_string_literal: true

# Model: ConceptProposal
class ConceptProposal < ApplicationRecord
  self.table_name = 'concept_proposal'
  self.primary_key = 'concept_proposal_id'

  has_many :concept_proposal_tag_map, foreign_key: concept_proposal_id, primary_key: concept_proposal_id
  validates :original_text, presence: true
  validates :state, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :locale, presence: true
  validates :uuid, presence: true
end
