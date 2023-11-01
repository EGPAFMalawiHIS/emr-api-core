# frozen_string_literal: true

# Model: ConceptReferenceSource
class ConceptReferenceSource < ApplicationRecord
  self.table_name = 'concept_reference_source'
  self.primary_key = 'concept_source_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :concept_reference_term, foreign_key: concept_source_id, primary_key: concept_source_id

  validates :name, presence: true
  validates :description, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
