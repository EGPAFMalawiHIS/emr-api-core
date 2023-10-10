# frozen_string_literal: true

# Model: OrderFrequency
class OrderFrequency < ApplicationRecord
  self.table_name = 'order_frequency'
  self.primary_key = 'order_frequency_id'

  has_many :drug_order, foreign_key: frequency, primary_key: order_frequency_id
  has_many :test_order, foreign_key: frequency, primary_key: order_frequency_id
  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
