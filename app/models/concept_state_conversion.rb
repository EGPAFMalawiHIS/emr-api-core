class ConceptStateConversion < ApplicationRecord
  belongs_to :concept
  belongs_to :program_workflow
  belongs_to :program_workflow_state
end
