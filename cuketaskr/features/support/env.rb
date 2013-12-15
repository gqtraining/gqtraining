$:.unshift(File.absolute_path(File.dirname(__FILE__),"../../lib"))
require 'taskr'

sequel_db_cleaner = DatabaseCleaner[:sequel, {connection: Database.instance.db}]

sequel_db_cleaner.strategy=:transaction

Before do
  sequel_db_cleaner.start
end

After do
  sequel_db_cleaner.clean
end
