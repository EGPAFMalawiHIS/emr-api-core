# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the cohort table
class AddPrimaryKeysAndIndexesToCohort < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE cohort ADD PRIMARY KEY (cohort_id)"
  end
end
