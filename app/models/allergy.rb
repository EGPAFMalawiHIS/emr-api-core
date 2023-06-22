class Allergy < ApplicationRecord
  belongs_to :patient
  belongs_to :severity_concept
end
