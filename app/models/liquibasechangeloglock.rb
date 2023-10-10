# frozen_string_literal: true

# Model: Liquibasechangeloglock
class Liquibasechangeloglock < ApplicationRecord
  self.table_name = 'liquibasechangeloglock'
  self.primary_key = 'ID'

  validates :LOCKED, presence: true
end
