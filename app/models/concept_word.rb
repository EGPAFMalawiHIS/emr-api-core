class ConceptWord < ApplicationRecord
  belongs_to :concept
  belongs_to :concept_name
end
