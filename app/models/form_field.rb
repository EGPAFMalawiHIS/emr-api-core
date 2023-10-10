# frozen_string_literal: true

# Model: FormField
class FormField < ApplicationRecord
  self.table_name = 'form_field'
  self.primary_key = 'form_field_id'

  has_many :form_field, foreign_key: parent_form_field, primary_key: form_field_id
  validates :form_id, presence: true
  validates :field_id, presence: true
  validates :required, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
