# frozen_string_literal: true

# Model: Tribe
class Tribe < ApplicationRecord
  self.table_name = 'tribe'
  self.primary_key = 'tribe_id'

  validates :retired, presence: true
  validates :name, presence: true
end
