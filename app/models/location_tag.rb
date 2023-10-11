# frozen_string_literal: true

# Model: LocationTag
class LocationTag < ApplicationRecord
  self.table_name = 'location_tag'
  self.primary_key = 'location_tag_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :location_tag_map, foreign_key: location_tag_id, primary_key: location_tag_id

  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
