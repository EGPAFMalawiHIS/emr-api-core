# frozen_string_literal: true

# Model: PersonAddress
class PersonAddress < VoidableRecord
  self.table_name = 'person_address'
  self.primary_key = 'person_address_id'

  belongs_to :person

  validates :preferred, presence: true
end
