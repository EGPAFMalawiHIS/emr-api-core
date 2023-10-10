# frozen_string_literal: true

# Model: EncounterRole
class EncounterRole < ApplicationRecord
  self.table_name = 'encounter_role'
  self.primary_key = 'encounter_role_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :encounter_provider, foreign_key: encounter_role_id, primary_key: encounter_role_id

  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
