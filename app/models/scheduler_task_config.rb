# frozen_string_literal: true

# Model: SchedulerTaskConfig
class SchedulerTaskConfig < ApplicationRecord
  self.table_name = 'scheduler_task_config'
  self.primary_key = 'task_config_id'

  has_many :scheduler_task_config_property, foreign_key: task_config_id, primary_key: task_config_id
  validates :name, presence: true
  validates :repeat_interval, presence: true
  validates :start_on_startup, presence: true
  validates :started, presence: true
  validates :uuid, presence: true
end
