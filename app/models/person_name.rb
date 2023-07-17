class PersonName < ApplicationRecord
  self.table_name = 'person_name'
  
  belongs_to :person
end
