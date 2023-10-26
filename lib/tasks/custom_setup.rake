db_config = Rails.configuration.database_configuration[Rails.env]

namespace :db do
  desc 'Custom setup for the database'
  task custom_setup: :environment do
    Rake::Task['db:drop'].invoke    # Optional: Drop the database if it exists
    Rake::Task['db:create'].invoke  # Create the database
    # Run mysql query to dump the openmrs_2.5.9 sql file
    system("mysql -u #{db_config['username']} -p#{db_config['password']} #{db_config['database']} < #{Rails.root}/db/sql/openmrs_2.5.9.sql")
    # Additional custom setup steps
    puts 'Custom setup complete.'
  end
end