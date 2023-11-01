# frozen_string_literal: true

# Model: XformsMedicalHistoryField
class XformsMedicalHistoryField < ApplicationRecord
  self.table_name = 'xforms_medical_history_field'
  self.primary_key = 'field_id'

  validates :name, presence: true
end
