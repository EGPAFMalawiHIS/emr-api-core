# frozen_string_literal: true

# Model: OrderFrequency
class OrderFrequency < ApplicationRecord
  self.table_name = 'order_frequency'
  self.primary_key = 'order_frequency_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :drug_order, foreign_key: frequency, primary_key: order_frequency_id
  has_many :test_order, foreign_key: frequency, primary_key: order_frequency_id

  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
