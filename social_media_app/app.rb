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
  login(params[:usernanem, params[:password]])
  
  if signed_in_user
    redirect '/user_home'
  else
    redirect '/'
  end
end


get '/user_home' do
  unless signed_in_user
    erb :user_home
  else
    "OOPs you are not logged in"
  end
end

helpers do
  def signed_in_user
    session[:user].nil?
  end

  def login(username, password)
    user = User.find_by_name(username)

    unless user.nil? && user.password != params[:password]
      session[:user] = user.id
    end
  end
end
