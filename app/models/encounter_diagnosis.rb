class EncounterDiagnosis < ApplicationRecord
  belongs_to :encounter
  belongs_to :patient
  belongs_to :condition
end
