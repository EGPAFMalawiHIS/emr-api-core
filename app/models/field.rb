# frozen_string_literal: true

# Model: Field
class Field < ApplicationRecord
  self.table_name = 'field'
  self.primary_key = 'field_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :field_answer, foreign_key: field_id, primary_key: field_id
  has_many :form_field, foreign_key: field_id, primary_key: field_id

  validates :name, presence: true
  validates :select_multiple, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
