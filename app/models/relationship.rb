# frozen_string_literal: true

# Model: Relationship
class Relationship < VoidableRecord
  self.table_name = 'relationship'
  self.primary_key = 'relationship_id'

  validates :person_a, presence: true
  validates :relationship, presence: true
  validates :person_b, presence: true
end
