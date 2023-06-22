class ConceptAttribute < ApplicationRecord
  belongs_to :concept
  belongs_to :attribute_type
end
