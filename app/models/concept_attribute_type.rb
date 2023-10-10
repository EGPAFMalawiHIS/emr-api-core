# frozen_string_literal: true

# Model: ConceptAttributeType
class ConceptAttributeType < ApplicationRecord
  self.table_name = 'concept_attribute_type'
  self.primary_key = 'concept_attribute_type_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :concept_attribute, foreign_key: attribute_type_id, primary_key: concept_attribute_type_id

  validates :name, presence: true
  validates :min_occurs, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
