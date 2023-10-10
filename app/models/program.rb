# frozen_string_literal: true

# Model: Program
class Program < ApplicationRecord
  self.table_name = 'program'
  self.primary_key = 'program_id'

  has_many :patient_program, foreign_key: program_id, primary_key: program_id
  has_many :program_workflow, foreign_key: program_id, primary_key: program_id
  validates :concept_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :name, presence: true
  validates :uuid, presence: true
end
