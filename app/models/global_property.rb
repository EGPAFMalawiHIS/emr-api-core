# frozen_string_literal: true

# Model: GlobalProperty
class GlobalProperty < ApplicationRecord
  self.table_name = 'global_property'
  self.primary_key = 'property'

  validates :uuid, presence: true
end
