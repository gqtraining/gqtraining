$:.unshift(File.absolute_path(File.dirname(__FILE__),"../../lib"))
require 'taskr'
require 'capybara/cucumber'
require 'capybara/poltergeist'
#Capybara.javascript_driver = :poltergeist
Capybara.javascript_driver = :selenium
Capybara.app_host="http://localhost:4567"
sequel_db_cleaner = DatabaseCleaner[:sequel, {connection: Database.instance.db}]

sequel_db_cleaner.strategy=:truncation

#def app
  #Sinatra::Application
#end
#World {
  #Capybara.app=Sinatra::Application
#}

Before do
  sequel_db_cleaner.start
end

After do |scenario|
  File.open('report','a') do |f|
    f.write(scenario.title + "\n")
  end
  sequel_db_cleaner.clean
end
