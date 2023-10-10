# frozen_string_literal: true

# Model: EncounterProvider
class EncounterProvider < ApplicationRecord
  self.table_name = 'encounter_provider'
  self.primary_key = 'encounter_provider_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true
  belongs_to :encounter, foreign_key: :encounter_id, primary_key: :encounter_id, optional: true
  belongs_to :provider, foreign_key: :provider_id, primary_key: :provider_id, optional: true
  belongs_to :encounter_role, foreign_key: :encounter_role_id, primary_key: :encounter_role_id, optional: true

  validates :encounter_id, presence: true
  validates :provider_id, presence: true
  validates :encounter_role_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
