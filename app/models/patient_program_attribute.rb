class PatientProgramAttribute < ApplicationRecord
  belongs_to :patient_program
  belongs_to :attribute_type
end
