# frozen_string_literal: true

# Model: TestOrder
class TestOrder < ApplicationRecord
  self.table_name = 'test_order'
  self.primary_key = 'order_id'

end
