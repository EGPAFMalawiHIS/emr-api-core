# frozen_string_literal: true

# Model: VisitAttribute
class VisitAttribute < ApplicationRecord
  self.table_name = 'visit_attribute'
  self.primary_key = 'visit_attribute_id'

  validates :visit_id, presence: true
  validates :attribute_type_id, presence: true
  validates :value_reference, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
