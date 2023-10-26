# frozen_string_literal: true

# Model: Program
class Program < RetirableRecord
  self.table_name = 'program'
  self.primary_key = 'program_id'

  has_many :patient_program, foreign_key: program_id, primary_key: program_id
  has_many :program_workflow, foreign_key: program_id, primary_key: program_id
  validates :concept_id, presence: true
end
