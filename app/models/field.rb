# frozen_string_literal: true

# Model: Field
class Field < ApplicationRecord
  self.table_name = 'field'
  self.primary_key = 'field_id'

  has_many :field_answer, foreign_key: field_id, primary_key: field_id
  has_many :form_field, foreign_key: field_id, primary_key: field_id
  validates :name, presence: true
  validates :select_multiple, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
