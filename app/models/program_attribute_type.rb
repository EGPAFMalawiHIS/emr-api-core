# frozen_string_literal: true

# Model: ProgramAttributeType
class ProgramAttributeType < ApplicationRecord
  self.table_name = 'program_attribute_type'
  self.primary_key = 'program_attribute_type_id'

  has_many :patient_program_attribute, foreign_key: attribute_type_id, primary_key: program_attribute_type_id
  validates :name, presence: true
  validates :min_occurs, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
