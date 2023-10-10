# frozen_string_literal: true

# Model: Relationship
class Relationship < ApplicationRecord
  self.table_name = 'relationship'
  self.primary_key = 'relationship_id'

  validates :person_a, presence: true
  validates :relationship, presence: true
  validates :person_b, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
