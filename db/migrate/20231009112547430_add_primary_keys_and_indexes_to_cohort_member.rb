# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the cohort_member table
class AddPrimaryKeysAndIndexesToCohortMember < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE cohort_member ADD PRIMARY KEY (cohort_member_id)"
  end
end
