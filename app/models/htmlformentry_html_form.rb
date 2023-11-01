# frozen_string_literal: true

# Model: HtmlformentryHtmlForm
class HtmlformentryHtmlForm < ApplicationRecord
  self.table_name = 'htmlformentry_html_form'
  self.primary_key = 'id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true

  validates :xml_data, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
