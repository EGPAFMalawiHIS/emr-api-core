# frozen_string_literal: true

# Model: ConceptProposalTagMap
class ConceptProposalTagMap < ApplicationRecord
  self.table_name = 'concept_proposal_tag_map'
  validates :concept_proposal_id, presence: true
  validates :concept_name_tag_id, presence: true
end
