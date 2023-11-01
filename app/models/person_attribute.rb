# frozen_string_literal: true

# Model: PersonAttribute
class PersonAttribute < VoidableRecord
  self.table_name = 'person_attribute'
  self.primary_key = 'person_attribute_id'

  belongs_to :person
  has_many :person_attribute_type

  validates :person_id, :value, :person_attribute_type_id, presence: true
end
