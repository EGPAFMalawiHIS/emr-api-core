# frozen_string_literal: true

# Model: XformsPersonRepeatAttribute
class XformsPersonRepeatAttribute < ApplicationRecord
  self.table_name = 'xforms_person_repeat_attribute'
  self.primary_key = 'person_repeat_attribute_id'

  validates :person_id, presence: true
  validates :value, presence: true
  validates :person_attribute_type_id, presence: true
  validates :value_id, presence: true
  validates :value_id_type, presence: true
  validates :value_display_order, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
