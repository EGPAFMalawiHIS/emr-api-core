class Observation < ApplicationRecord
  self.table_name = "obs"

  belongs_to :person
  belongs_to :concept
  belongs_to :encounter
  belongs_to :order
  belongs_to :location
  belongs_to :obs_group
  belongs_to :value_group
  belongs_to :value_coded_name
end
