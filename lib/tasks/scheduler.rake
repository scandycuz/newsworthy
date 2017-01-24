desc "This task is called by the Heroku scheduler add-on and queries the Intrinio API for new stock ticker articles"
task :get_articles => :environment do
  puts "Getting relevant articles"
  IntrinioAPI.new.get_articles
  puts "Articles retreived"
end

desc "Temp"
task :test_cache => :environment do
  puts "Testing Cache"
  IntrinioAPI.new.test_cache
  puts "Done"
end
