# frozen_string_literal: true

# Model: NotificationAlertRecipient
class NotificationAlertRecipient < ApplicationRecord
  self.table_name = 'notification_alert_recipient'
  self.primary_key = '["alert_id", "user_id"]'

  validates :alert_id, presence: true
  validates :user_id, presence: true
  validates :alert_read, presence: true
  validates :uuid, presence: true
end
