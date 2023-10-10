# frozen_string_literal: true

# Model: SchedulerTaskConfigProperty
class SchedulerTaskConfigProperty < ApplicationRecord
  self.table_name = 'scheduler_task_config_property'
  self.primary_key = 'task_config_property_id'

  validates :name, presence: true
end
