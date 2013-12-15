require 'singleton'
require 'yaml'
class Database
  include Singleton
  attr_accessor :db
  def db
    return @db if @db
    env = ENV['APP_ENV'] || "development"
    config = YAML.load_file('conf/database.yml')
    @db = Sequel.connect(config[env])
  end
end
