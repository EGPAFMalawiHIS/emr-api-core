# frozen_string_literal: true

# Model: Liquibasechangelog
class Liquibasechangelog < ApplicationRecord
  self.table_name = 'liquibasechangelog'
  self.primary_key = '["ID", "AUTHOR", "FILENAME"]'

  validates :ID, presence: true
  validates :AUTHOR, presence: true
  validates :FILENAME, presence: true
  validates :DATEEXECUTED, presence: true
  validates :ORDEREXECUTED, presence: true
  validates :EXECTYPE, presence: true
end
