# frozen_string_literal: true

# Model: OrderSet
class OrderSet < ApplicationRecord
  self.table_name = 'order_set'
  self.primary_key = 'order_set_id'

  has_many :order_group, foreign_key: order_set_id, primary_key: order_set_id
  has_many :order_set_member, foreign_key: order_set_id, primary_key: order_set_id
  validates :operator, presence: true
  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
