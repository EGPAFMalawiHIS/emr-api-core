# frozen_string_literal: true

# Model: ProgramWorkflow
class ProgramWorkflow < ApplicationRecord
  self.table_name = 'program_workflow'
  self.primary_key = 'program_workflow_id'

  has_many :concept_state_conversion, foreign_key: program_workflow_id, primary_key: program_workflow_id
  has_many :program_workflow_state, foreign_key: program_workflow_id, primary_key: program_workflow_id
  validates :program_id, presence: true
  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
