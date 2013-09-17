require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'
require_relative 'models/post'

enable :sessions

set :database, "sqlite3:///social_media.db"


get '/' do
  erb :sign_in
end


post '/sign_in_verify' do
  login(params[:username], params[:password])
  
  if signed_in_user
    redirect '/user_home'
  else
    redirect '/'
  end
end

post '/sign_up' do
  new_user = User.create(name: params[:name], email: params[:email], password: params[:password])
  session[:user] = new_user.id 
  redirect '/user_home'
end

get '/user_home' do
  if signed_in_user
    erb :user_home
  else
    "OOPs you are not logged in"
  end
end

helpers do
  def signed_in_user
    !session[:user].nil?
  end

  def login(username, password)
    user = User.find_by_name(username)

    unless user.nil? && user.password != password
      session[:user] = user.id
    end
  end
end
