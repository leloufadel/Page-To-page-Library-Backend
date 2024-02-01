#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
./bin/rails assets:precompile
./bin/rails assets:clean
./bin/rails db:reset
./bin/rails db:migrate
./bin/rails runner "ActiveRecord::Base.connection.tables.each { |t| ActiveRecord::Base.connection.execute('TRUNCATE TABLE ' + t + ' CASCADE') unless ['schema_migrations', 'ar_internal_metadata'].include?(t) }"
./bin/rails db:seed