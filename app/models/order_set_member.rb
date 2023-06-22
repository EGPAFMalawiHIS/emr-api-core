class OrderSetMember < ApplicationRecord
  belongs_to :order_set
  belongs_to :concept
end
