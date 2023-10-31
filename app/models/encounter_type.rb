# frozen_string_literal: true

# Model: EncounterType
class EncounterType < ApplicationRecord
  self.table_name = 'encounter_type'
  self.primary_key = 'encounter_type_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id
  has_many :encounter, foreign_key: :encounter_type, primary_key: :encounter_type_id
  has_many :form, foreign_key: :encounter_type, primary_key: :encounter_type_id
end
