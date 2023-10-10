# frozen_string_literal: true

# Model: NotificationTemplate
class NotificationTemplate < ApplicationRecord
  self.table_name = 'notification_template'
  self.primary_key = 'template_id'

  validates :uuid, presence: true
end
