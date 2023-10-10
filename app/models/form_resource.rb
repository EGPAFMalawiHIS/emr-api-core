# frozen_string_literal: true

# Model: FormResource
class FormResource < ApplicationRecord
  self.table_name = 'form_resource'
  self.primary_key = 'form_resource_id'

  validates :form_id, presence: true
  validates :name, presence: true
  validates :value_reference, presence: true
  validates :uuid, presence: true
end
