# frozen_string_literal: true

# Model: ConceptProposal
class ConceptProposal < ApplicationRecord
  self.table_name = 'concept_proposal'
  self.primary_key = 'concept_proposal_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  belongs_to :state, class_name: 'ConceptProposalState', foreign_key: :state, primary_key: :concept_proposal_state_id, optional: true
  belongs_to :encounter, foreign_key: :encounter_id, primary_key: :encounter_id, optional: true
  belongs_to :observation, foreign_key: :obs_id, primary_key: :obs_id, optional: true
  belongs_to :observation_concept, class_name: 'Concept', foreign_key: :obs_concept_id, primary_key: :concept_id, optional: true
  has_many :concept_proposal_tag_map, foreign_key: concept_proposal_id, primary_key: concept_proposal_id
  
  validates :original_text, presence: true
  validates :state, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :locale, presence: true
  validates :uuid, presence: true
end
