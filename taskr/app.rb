require 'bundler'
Bundler.require

get '/' do
  "hello web app"
end
get '/:name' do
  "hello #{params[:name]}"
end
