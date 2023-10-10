# frozen_string_literal: true

# Model: HtmlformentryHtmlForm
class HtmlformentryHtmlForm < ApplicationRecord
  self.table_name = 'htmlformentry_html_form'
  self.primary_key = 'id'

  validates :xml_data, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
