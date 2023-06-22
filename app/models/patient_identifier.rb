class PatientIdentifier < ApplicationRecord
  belongs_to :patient
  belongs_to :location
end
