# frozen_string_literal: true

# Model: ClobDatatypeStorage
class ClobDatatypeStorage < ApplicationRecord
  self.table_name = 'clob_datatype_storage'
  self.primary_key = 'id'

  validates :uuid, presence: true
  validates :value, presence: true
end
