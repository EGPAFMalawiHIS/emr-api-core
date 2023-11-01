# frozen_string_literal: true

# Model: Order
class Order < VoidableRecord
  self.table_name = 'orders'
  self.primary_key = 'order_id'

  has_many :drug_order, foreign_key: order_id, primary_key: order_id
  has_many :obs, foreign_key: order_id, primary_key: order_id
  has_many :orders, foreign_key: previous_order_id, primary_key: order_id
  has_many :test_order, foreign_key: order_id, primary_key: order_id

  has_one :order_type, foreign_key: order_type_id, primary_key: order_type_id

  validates :order_type_id, :concept_id, :orderer, :encounter_id, :creator, :date_created, :voided, :patient_id, :uuid, :urgency, :order_number, :order_action, presence: true
end
