# frozen_string_literal: true

# Model: FormentryXsn
class FormentryXsn < ApplicationRecord
  self.table_name = 'formentry_xsn'
  self.primary_key = 'formentry_xsn_id'

  validates :form_id, presence: true
  validates :xsn_data, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :archived, presence: true
  validates :uuid, presence: true
end
