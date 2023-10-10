# frozen_string_literal: true

# Model: OrderSetMember
class OrderSetMember < ApplicationRecord
  self.table_name = 'order_set_member'
  self.primary_key = 'order_set_member_id'

  validates :order_type, presence: true
  validates :order_set_id, presence: true
  validates :sequence_number, presence: true
  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
