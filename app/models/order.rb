class Order < ApplicationRecord
  belongs_to :order_type
  belongs_to :concept
  belongs_to :encounter
  belongs_to :patient
  belongs_to :previous_order
  belongs_to :order_group
end
