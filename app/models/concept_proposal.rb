class ConceptProposal < ApplicationRecord
  belongs_to :concept
  belongs_to :encounter
  belongs_to :obs
  belongs_to :obs_concept
end
