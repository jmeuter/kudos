desc 'Kudos Tasks'
namespace :kudos do
  desc 'Add kudos to all users (limit 3)'
  task :add_kudos => :environment do
    User.add_kudos
  end
end