class Provider < ApplicationRecord
  belongs_to :person
  belongs_to :role
  belongs_to :speciality
end
