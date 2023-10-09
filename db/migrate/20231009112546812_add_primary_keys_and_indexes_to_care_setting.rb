# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the care_setting table
class AddPrimaryKeysAndIndexesToCareSetting < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE care_setting ADD PRIMARY KEY (care_setting_id)"
  end
end
