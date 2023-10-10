# frozen_string_literal: true

# Model: DrugOrder
class DrugOrder < ApplicationRecord
  self.table_name = 'drug_order'
  self.primary_key = 'order_id'

  validates :dispense_as_written, presence: true
end
