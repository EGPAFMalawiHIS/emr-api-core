class EncounterProvider < ApplicationRecord
  belongs_to :encounter
  belongs_to :provider
  belongs_to :encounter_role
end
