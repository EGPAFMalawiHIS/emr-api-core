# frozen_string_literal: true

# Model: OrderType
class OrderType < RetirableRecord
  self.table_name = 'order_type'
  self.primary_key = 'order_type_id'

  has_many :order_set_member, foreign_key: order_type, primary_key: order_type_id
  has_many :order_type, foreign_key: parent, primary_key: order_type_id
  has_many :order_type_class_map, foreign_key: order_type_id, primary_key: order_type_id
  has_many :orders, foreign_key: order_type_id, primary_key: order_type_id
  validates :name, presence: true
  validates :java_class_name, presence: true
end
