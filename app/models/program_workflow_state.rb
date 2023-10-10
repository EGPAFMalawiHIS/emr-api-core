# frozen_string_literal: true

# Model: ProgramWorkflowState
class ProgramWorkflowState < ApplicationRecord
  self.table_name = 'program_workflow_state'
  self.primary_key = 'program_workflow_state_id'

  has_many :concept_state_conversion, foreign_key: program_workflow_state_id, primary_key: program_workflow_state_id
  has_many :patient_state, foreign_key: state, primary_key: program_workflow_state_id
  validates :program_workflow_id, presence: true
  validates :concept_id, presence: true
  validates :initial, presence: true
  validates :terminal, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
