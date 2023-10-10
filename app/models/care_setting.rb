# frozen_string_literal: true

# Model: CareSetting
class CareSetting < ApplicationRecord
  self.table_name = 'care_setting'
  self.primary_key = 'care_setting_id'

  has_many :orders, foreign_key: care_setting, primary_key: care_setting_id
  validates :name, presence: true
  validates :care_setting_type, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
