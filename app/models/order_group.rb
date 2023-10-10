# frozen_string_literal: true

# Model: OrderGroup
class OrderGroup < ApplicationRecord
  self.table_name = 'order_group'
  self.primary_key = 'order_group_id'

  has_many :orders, foreign_key: order_group_id, primary_key: order_group_id
  validates :patient_id, presence: true
  validates :encounter_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
