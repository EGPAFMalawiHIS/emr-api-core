# frozen_string_literal: true

# Model: FormField
class FormField < ApplicationRecord
  self.table_name = 'form_field'
  self.primary_key = 'form_field_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  has_many :form_field, foreign_key: parent_form_field, primary_key: form_field_id

  validates :form_id, presence: true
  validates :field_id, presence: true
  validates :required, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
