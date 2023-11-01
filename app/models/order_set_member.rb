# frozen_string_literal: true

# Model: OrderSetMember
class OrderSetMember < ApplicationRecord
  self.table_name = 'order_set_member'
  self.primary_key = 'order_set_member_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true

  validates :order_type, presence: true
  validates :order_set_id, presence: true
  validates :sequence_number, presence: true
  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
