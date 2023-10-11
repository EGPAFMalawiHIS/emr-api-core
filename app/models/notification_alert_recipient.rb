# frozen_string_literal: true

# Model: NotificationAlertRecipient
class NotificationAlertRecipient < ApplicationRecord
  self.table_name = 'notification_alert_recipient'
  self.primary_key = '["alert_id", "user_id"]'

  belongs_to :alert, class_name: 'NotificationAlert', foreign_key: :alert_id, primary_key: :alert_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id, primary_key: :user_id, optional: true

  validates :alert_id, presence: true
  validates :user_id, presence: true
  validates :alert_read, presence: true
  validates :uuid, presence: true
end
