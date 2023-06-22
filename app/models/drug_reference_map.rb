class DrugReferenceMap < ApplicationRecord
  belongs_to :drug
  belongs_to :term
end
