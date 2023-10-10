# frozen_string_literal: true

# Model: XformsXform
class XformsXform < ApplicationRecord
  self.table_name = 'xforms_xform'
  self.primary_key = 'form_id'

  validates :creator, presence: true
  validates :date_created, presence: true
end
