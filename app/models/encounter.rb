# frozen_string_literal: true

# Model: Encounter
class Encounter < VoidableRecord
  self.table_name = 'encounter'
  self.primary_key = 'encounter_id'

  belongs_to :location, foreign_key: :location_id, primary_key: :location_id
  has_one :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id
  has_one :patient, foreign_key: :patient_id, primary_key: :patient_id
  has_one :type, class_name: 'EncounterType', foreign_key: :encounter_type, primary_key: :encounter_type_id
  has_many :concept_proposal, foreign_key: :encounter_id, primary_key: :encounter_id
  has_many :encounter_diagnosis, foreign_key: :encounter_id, primary_key: :encounter_id
  has_many :encounter_provider, foreign_key: :encounter_id, primary_key: :encounter_id
  has_many :note, foreign_key: :encounter_id, primary_key: :encounter_id
  has_many :obs, foreign_key: :encounter_id, primary_key: :encounter_id
  has_many :order_group, foreign_key: :encounter_id, primary_key: :encounter_id
  has_many :orders, foreign_key: :encounter_id, primary_key: :encounter_id

  validates :encounter_type, :patient, :encounter_datetime, presence: true

  def self.add_provider(provider)
    self.encounter_provider.create(provider)
  end
end
