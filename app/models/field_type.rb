# frozen_string_literal: true

# Model: FieldType
class FieldType < ApplicationRecord
  self.table_name = 'field_type'
  self.primary_key = 'field_type_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  has_many :field, foreign_key: field_type, primary_key: field_type_id
  
  validates :is_set, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
