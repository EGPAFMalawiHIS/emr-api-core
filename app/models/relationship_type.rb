# frozen_string_literal: true

# Model: RelationshipType
class RelationshipType < ApplicationRecord
  self.table_name = 'relationship_type'
  self.primary_key = 'relationship_type_id'

  has_many :relationship, foreign_key: relationship, primary_key: relationship_type_id
  validates :a_is_to_b, :b_is_to_a, :preferred, :weight, presence: true
end
