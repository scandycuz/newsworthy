desc "This task is called by the Heroku scheduler add-on and queries the Intrinio API for new stock ticker articles"
task :get_articles => :environment do
  puts "Getting relevant articles"
  IntrinioAPI.new.get_articles
  puts "Articles retreived"
end

desc "This task is called by the Heroku scheduler add-on and analyzes the sentiment of articles in the database"
task :analyze_sentiment => :environment do
  puts "Analyzing articles"
  AlchemyAPI.new.analyze_sentiment
  puts "Articles analyzed"
end

desc "Temporary testing to confirm cache working in heroku"
task :test_cache => :environment do
  puts "Testing Cache"
  IntrinioAPI.new.test_cache
  puts "Done"
end
