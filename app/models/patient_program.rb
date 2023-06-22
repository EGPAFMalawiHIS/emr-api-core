class PatientProgram < ApplicationRecord
  belongs_to :patient
  belongs_to :program
  belongs_to :location
  belongs_to :outcome_concept
end
