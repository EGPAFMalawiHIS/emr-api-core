# frozen_string_literal: true

# Model: OrderTypeClassMap
class OrderTypeClassMap < ApplicationRecord
  self.table_name = 'order_type_class_map'
  self.primary_key = '["order_type_id", "concept_class_id"]'

  validates :order_type_id, presence: true
  validates :concept_class_id, presence: true
end
