class PersonAttribute < ApplicationRecord
  belongs_to :person
  belongs_to :person_attribute_type
end
