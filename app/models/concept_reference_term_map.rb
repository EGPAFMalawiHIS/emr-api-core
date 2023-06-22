class ConceptReferenceTermMap < ApplicationRecord
  belongs_to :term_a
  belongs_to :term_b
  belongs_to :a_is_to_b
end
