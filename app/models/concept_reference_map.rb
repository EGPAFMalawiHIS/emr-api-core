class ConceptReferenceMap < ApplicationRecord
  belongs_to :concept
  belongs_to :concept_reference_term
  belongs_to :concept_map_type
end
