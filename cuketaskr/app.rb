require 'bundler'
Bundler.require
require './lib/taskr'
require 'sinatra/json'

Database.instance.migrate_database

get '/' do
  erb :index
end

post '/tasks' do
  tparams=['title','status']
  json Task.create(params.select {|k,v| tparams.include?(k)})
end

post '/tasks/:id' do
  tparams=['title','status']
  task=Task.where(:id=>params[:id]).first
  json task.update(params.select {|k,v| tparams.include?(k)})
end
get '/tasks' do
  json Task.all
end

