require 'sinatra'
require 'shotgun'

get '/' do
  "Hello, DUKE"
end

get '/hello/:name' do
  "Hey man whatsup #{params[:name]}"
  "nm"
end