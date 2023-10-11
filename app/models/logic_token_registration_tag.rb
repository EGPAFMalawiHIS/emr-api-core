# frozen_string_literal: true

# Model: LogicTokenRegistrationTag
class LogicTokenRegistrationTag < ApplicationRecord
  self.table_name = 'logic_token_registration_tag'
  
  validates :token_registration_id, presence: true
  validates :tag, presence: true
end
