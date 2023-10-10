# frozen_string_literal: true

# Model: LogicTokenRegistration
class LogicTokenRegistration < ApplicationRecord
  self.table_name = 'logic_token_registration'
  self.primary_key = 'token_registration_id'

  has_many :logic_token_registration_tag, foreign_key: token_registration_id, primary_key: token_registration_id
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :token, presence: true
  validates :provider_class_name, presence: true
  validates :provider_token, presence: true
  validates :uuid, presence: true
end
