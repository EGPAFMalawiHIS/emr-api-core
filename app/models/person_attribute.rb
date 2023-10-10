# frozen_string_literal: true

# Model: PersonAttribute
class PersonAttribute < ApplicationRecord
  self.table_name = 'person_attribute'
  self.primary_key = 'person_attribute_id'

  validates :person_id, presence: true
  validates :value, presence: true
  validates :person_attribute_type_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
