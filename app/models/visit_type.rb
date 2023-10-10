# frozen_string_literal: true

# Model: VisitType
class VisitType < ApplicationRecord
  self.table_name = 'visit_type'
  self.primary_key = 'visit_type_id'

  has_many :visit, foreign_key: visit_type_id, primary_key: visit_type_id
  validates :name, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
end
