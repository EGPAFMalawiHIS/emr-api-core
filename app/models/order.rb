# frozen_string_literal: true

# Model: Order
class Order < ApplicationRecord
  self.table_name = 'orders'
  self.primary_key = 'order_id'

  has_many :drug_order, foreign_key: order_id, primary_key: order_id
  has_many :obs, foreign_key: order_id, primary_key: order_id
  has_many :orders, foreign_key: previous_order_id, primary_key: order_id
  has_many :test_order, foreign_key: order_id, primary_key: order_id
  validates :order_type_id, presence: true
  validates :concept_id, presence: true
  validates :orderer, presence: true
  validates :encounter_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :patient_id, presence: true
  validates :uuid, presence: true
  validates :urgency, presence: true
  validates :order_number, presence: true
  validates :order_action, presence: true
  validates :care_setting, presence: true
end
