class ProgramWorkflowState < ApplicationRecord
  belongs_to :program_workflow
  belongs_to :concept
end
