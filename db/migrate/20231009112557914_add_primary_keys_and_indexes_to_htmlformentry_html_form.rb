# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the htmlformentry_html_form table
class AddPrimaryKeysAndIndexesToHtmlformentryHtmlForm < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE htmlformentry_html_form ADD PRIMARY KEY (id)"
  end
end
