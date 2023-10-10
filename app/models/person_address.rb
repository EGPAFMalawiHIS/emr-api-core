# frozen_string_literal: true

# Model: PersonAddress
class PersonAddress < ApplicationRecord
  self.table_name = 'person_address'
  self.primary_key = 'person_address_id'

  validates :preferred, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
