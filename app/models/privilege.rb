# frozen_string_literal: true

# Model: Privilege
class Privilege < ApplicationRecord
  self.table_name = 'privilege'
  self.primary_key = 'privilege'

  has_many :encounter_type, foreign_key: edit_privilege, primary_key: privilege
  has_many :encounter_type, foreign_key: view_privilege, primary_key: privilege
  has_many :person_attribute_type, foreign_key: edit_privilege, primary_key: privilege
  has_many :role_privilege, foreign_key: privilege, primary_key: privilege
  validates :uuid, presence: true
end
