class XformsPersonRepeatAttribute < ApplicationRecord
  belongs_to :person
  belongs_to :person_attribute_type
  belongs_to :value
end
