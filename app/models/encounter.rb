class Encounter < ApplicationRecord
  belongs_to :patient
  belongs_to :location
  belongs_to :form
  belongs_to :visit
end
