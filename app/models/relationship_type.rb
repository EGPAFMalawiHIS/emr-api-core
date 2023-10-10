# frozen_string_literal: true

# Model: RelationshipType
class RelationshipType < ApplicationRecord
  self.table_name = 'relationship_type'
  self.primary_key = 'relationship_type_id'

  has_many :relationship, foreign_key: relationship, primary_key: relationship_type_id
  validates :a_is_to_b, presence: true
  validates :b_is_to_a, presence: true
  validates :preferred, presence: true
  validates :weight, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
  validates :retired, presence: true
end
