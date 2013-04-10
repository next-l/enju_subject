require 'active_record/fixtures'
desc "create initial records for enju_subject"
namespace :enju_subject do
  task :setup => :environment do
    Dir.glob(Rails.root.to_s + '/db/fixtures/enju_subject/*.yml').each do |file|
      ActiveRecord::Fixtures.create_fixtures('db/fixtures/enju_subject', File.basename(file, '.*'))
    end

    puts 'initial fixture files loaded.'
  end
end
