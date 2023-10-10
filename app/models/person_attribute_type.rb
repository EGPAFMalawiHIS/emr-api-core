# frozen_string_literal: true

# Model: PersonAttributeType
class PersonAttributeType < ApplicationRecord
  self.table_name = 'person_attribute_type'
  self.primary_key = 'person_attribute_type_id'

  has_many :person_attribute, foreign_key: person_attribute_type_id, primary_key: person_attribute_type_id
  has_many :xforms_person_repeat_attribute, foreign_key: person_attribute_type_id, primary_key: person_attribute_type_id
  validates :name, presence: true
  validates :searchable, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
