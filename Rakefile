# frozen_string_literal: true

require_relative 'system/container'
require 'dry-validation'

# Enable database component
Container.start(:database)

# Enable logger component
Container.start(:logger)

migrate =
  lambda do |version|
    # Enable Sequel migration extension
    Sequel.extension(:migration)

    # Perform migrations based on migration files in a specified directory
    Sequel::Migrator.apply(Container['persistance.db'], 'db/migrate', version)

    # Dump database schema after migration
    Rake::Task['db:dump'].invoke
  end

namespace :db do
  desc 'Migrate the database'
  task :migrate do
    migrate.call(nil)
  end

  desc 'Rolling back latest migration'
  task :rollback do |_, _args|
    current_version = Container['persistance.db'].fetch('SELECT * FROM schema_info').first[:version]

    migrate.call(current_version - 1)
  end

  desc 'Dump database schema to file'
  task :dump do
    sh %(pg_dump --schema-only --no-privileges --no-owner -s #{Container['persistance.db'].url} > db/structure.sql) if Container.development?
  end

  desc 'Seed database with test data'
  task :seed do
    sh %(ruby db/seeds.rb)
  end
end

desc 'Generate project documentation using yard'
task :docs do
  sh %(yard doc *.rb app/ lib/)
end
