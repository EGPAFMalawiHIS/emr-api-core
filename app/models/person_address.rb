class PersonAddress < VoidableRecord
  self.table_name = 'person_address'
  belongs_to :person
end
