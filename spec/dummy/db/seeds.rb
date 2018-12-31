# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Change the following
username = 'admin'
email = 'admin@example.jp'
password = 'adminpassword'

# Don't edit!
require 'active_record/fixtures'

unless solr = Sunspot.commit rescue nil
  raise "Solr is not running."
end

Dir.glob(Rails.root.to_s + '/db/fixtures/*.yml').each do |file|
  ActiveRecord::Fixtures.create_fixtures('spec/dummy/db/fixtures', File.basename(file, '.*'))
end

user = User.new
user.username = username
user.email = email
user.password = password
user.password_confirmation = password
user.role = Role.find_by_name('Administrator')
user.save!
puts 'Administrator account created.'
