# frozen_string_literal: true

# Model: NotificationAlert
class NotificationAlert < ApplicationRecord
  self.table_name = 'notification_alert'
  self.primary_key = 'alert_id'

  has_many :notification_alert_recipient, foreign_key: alert_id, primary_key: alert_id
  validates :text, presence: true
  validates :satisfied_by_any, presence: true
  validates :alert_read, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
