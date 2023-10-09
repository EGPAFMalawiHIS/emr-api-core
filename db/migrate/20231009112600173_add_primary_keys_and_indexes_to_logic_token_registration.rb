# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the logic_token_registration table
class AddPrimaryKeysAndIndexesToLogicTokenRegistration < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE logic_token_registration ADD PRIMARY KEY (token_registration_id)"
  end
end
