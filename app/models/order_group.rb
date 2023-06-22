class OrderGroup < ApplicationRecord
  belongs_to :order_set
  belongs_to :patient
  belongs_to :encounter
end
