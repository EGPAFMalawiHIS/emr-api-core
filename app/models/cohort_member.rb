class CohortMember < ApplicationRecord
  belongs_to :cohort
  belongs_to :patient
end
