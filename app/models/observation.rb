# frozen_string_literal: true

# Model: Observation
class Observation < VoidableRecord
  self.table_name = 'obs'
  self.primary_key = 'obs_id'

  belongs_to :person, class_name: 'Person', foreign_key: person_id, primary_key: person_id, optional: true
  belongs_to :concept, class_name: 'Concept', foreign_key: concept_id, primary_key: concept_id, optional: true
  belongs_to :encounter, class_name: 'Encounter', foreign_key: encounter_id, primary_key: encounter_id, optional: true
  belongs_to :order, class_name: 'Order', foreign_key: order_id, primary_key: order_id, optional: true
  belongs_to :location, class_name: 'Location', foreign_key: location_id, primary_key: location_id, optional: true
  belongs_to :obs_group, class_name: 'Observation', foreign_key: obs_group_id, primary_key: obs_id, optional: true
  belongs_to :answer, class_name: 'Concept', foreign_key: value_coded, primary_key: concept_id, optional: true
  has_many :concept_proposal, foreign_key: obs_id, primary_key: obs_id
  has_many :note, foreign_key: obs_id, primary_key: obs_id

  validates :obs_id, :person_id, :concept_id, :obs_datetime, :status, presence: true
end
