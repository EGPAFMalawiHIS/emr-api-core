# frozen_string_literal: true

# Model: PersonName
class PersonName < VoidableRecord
  self.table_name = 'person_name'
  self.primary_key = 'person_name_id'

  belongs_to :person, optional: false

  validates :person_id, presence: true
end
