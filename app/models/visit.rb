class Visit < ApplicationRecord
  belongs_to :patient
  belongs_to :visit_type
  belongs_to :indication_concept
  belongs_to :location
end
