# frozen_string_literal: true

# Model: Person
class Person < ApplicationRecord
  self.table_name = 'person'
  self.primary_key = 'person_id'

  has_many :logic_rule_token, foreign_key: changed_by, primary_key: person_id
  has_many :logic_rule_token, foreign_key: creator, primary_key: person_id
  has_many :obs, foreign_key: person_id, primary_key: person_id
  has_many :patient, foreign_key: patient_id, primary_key: person_id
  has_many :person_address, foreign_key: person_id, primary_key: person_id
  has_many :person_attribute, foreign_key: person_id, primary_key: person_id
  has_many :person_merge_log, foreign_key: loser_person_id, primary_key: person_id
  has_many :person_merge_log, foreign_key: winner_person_id, primary_key: person_id
  has_many :person_name, foreign_key: person_id, primary_key: person_id
  has_many :provider, foreign_key: person_id, primary_key: person_id
  has_many :relationship, foreign_key: person_a, primary_key: person_id
  has_many :relationship, foreign_key: person_b, primary_key: person_id
  has_many :users, foreign_key: person_id, primary_key: person_id
  has_many :xforms_person_repeat_attribute, foreign_key: person_id, primary_key: person_id
  validates :birthdate_estimated, presence: true
  validates :dead, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
  validates :deathdate_estimated, presence: true
end
