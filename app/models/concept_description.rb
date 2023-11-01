# frozen_string_literal: true

# Model: ConceptDescription
class ConceptDescription < ApplicationRecord
  self.table_name = 'concept_description'
  self.primary_key = 'concept_description_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true

  validates :concept_id, presence: true
  validates :description, presence: true
  validates :locale, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
