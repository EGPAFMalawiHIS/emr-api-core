# frozen_string_literal: true

# Model: ConceptDatatype
class ConceptDatatype < ApplicationRecord
  self.table_name = 'concept_datatype'
  self.primary_key = 'concept_datatype_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :concept, foreign_key: datatype_id, primary_key: concept_datatype_id

  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
