# frozen_string_literal: true

# Model: PersonAttributeType
class PersonAttributeType < RetirableRecord
  self.table_name = 'person_attribute_type'
  self.primary_key = 'person_attribute_type_id'

  has_many :person_attribute, foreign_key: person_attribute_type_id, primary_key: person_attribute_type_id
  has_many :xforms_person_repeat_attribute, foreign_key: person_attribute_type_id, primary_key: person_attribute_type_id

  validates :name, :searchable, presence: true
end
