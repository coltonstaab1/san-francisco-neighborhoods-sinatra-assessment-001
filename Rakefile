ENV["SINATRA_ENV"] ||= "development"

namespace :db do
  desc "Erase all tables"
  task :clear => :environment do
    conn = ActiveRecord::Base.connection
    tables = conn.tables
    tables.each do |table|
      puts "Deleting #{table}"
      conn.drop_table(table)
    end
  end
end

require_relative './config/environment'
require 'sinatra/activerecord/rake'