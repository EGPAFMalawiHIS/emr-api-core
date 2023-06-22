class ConceptProposalTagMap < ApplicationRecord
  belongs_to :concept_proposal
  belongs_to :concept_name_tag
end
