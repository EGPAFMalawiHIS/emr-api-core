# frozen_string_literal: true

# Model: PersonName
class PersonName < ApplicationRecord
  self.table_name = 'person_name'
  self.primary_key = 'person_name_id'

  validates :preferred, presence: true
  validates :person_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
