class Person < VoidableRecord
  self.table_name = 'person'
  self.primary_key = 'person_id'

  has_one :patient, foreign_key: :patient_id, primary_key: :person_id
  has_many :person_address, foreign_key: :person_id, primary_key: :person_id
  has_many :person_attribute, foreign_key: :person_id, primary_key: :person_id
  has_many :person_name, foreign_key: :person_id, primary_key: :person_id
  has_many :person_relationship, foreign_key: :person_a, primary_key: :person_id
  has_many :person_relationship, foreign_key: :person_b, primary_key: :person_id

  validates :birthdate, presence: true
end