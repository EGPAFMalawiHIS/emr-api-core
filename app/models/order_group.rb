# frozen_string_literal: true

# Model: OrderGroup
class OrderGroup < ApplicationRecord
  self.table_name = 'order_group'
  self.primary_key = 'order_group_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :voider, class_name: 'User', foreign_key: :voided_by, primary_key: :user_id, optional: true
  has_many :orders, foreign_key: order_group_id, primary_key: order_group_id

  validates :patient_id, presence: true
  validates :encounter_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
