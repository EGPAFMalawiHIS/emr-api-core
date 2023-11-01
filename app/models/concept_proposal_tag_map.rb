# frozen_string_literal: true

# Model: ConceptProposalTagMap
class ConceptProposalTagMap < ApplicationRecord
  self.table_name = 'concept_proposal_tag_map'

  belongs_to :concept_proposal, foreign_key: :concept_proposal_id, primary_key: :concept_proposal_id, optional: true
  belongs_to :concept_name_tag, foreign_key: :concept_name_tag_id, primary_key: :concept_name_tag_id, optional: true

  # concept_proposal_id and concept_name_tag_id are unique together
  validates :concept_proposal_id, uniqueness: { scope: :concept_name_tag_id }
  validates :concept_proposal_id, presence: true
  validates :concept_name_tag_id, presence: true
end
