require 'singleton'
require 'yaml'
class Database
  include Singleton
  attr_accessor :db
  def db
    return @db if @db
    env = ENV['APP_ENV'].to_s.empty? ? "development" : ENV['APP_ENV']
    config = YAML.load_file('conf/database.yml')
    puts "using db config #{config[env].inspect}"
    @db = Sequel.connect(config[env])
  end
  def migrate_database
    db << "create table if not exists tasks (id integer primary key autoincrement, title varchar(255), status varchar(255))"
  end
end
