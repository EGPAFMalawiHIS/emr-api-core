# frozen_string_literal: true

# Model: ProgramAttributeType
class ProgramAttributeType < RetirableRecord
  self.table_name = 'program_attribute_type'
  self.primary_key = 'program_attribute_type_id'

  has_many :patient_program_attribute, foreign_key: attribute_type_id, primary_key: program_attribute_type_id
  validates :name, :min_occurs, presence: true
end
