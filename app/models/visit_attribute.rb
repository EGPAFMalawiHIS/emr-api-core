class VisitAttribute < ApplicationRecord
  belongs_to :visit
  belongs_to :attribute_type
end
