require 'sinatra'
require 'shotgun'
require 'ActiveRecord'

get '/' do
  "Hello, DUKE"
end

get '/hello/:name' do
  "Hey man whatsup #{params[:name]}"
  "nm"
end

get '/form' do  
  erb :form  
end 

post '/form' do  
  "You said '#{params[:message]}'"  
end 

not_found do  
  status 404  
  "404"
  erb :form 
end  
