require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'
require_relative 'models/post'

enable :sessions

set :database, "sqlite3:///social_media.db"




get '/' do
  session[:user] ||= nil
  erb :sign_in
end


post '/sign_in_verify' do
  @user = User.find_by_name(params[:username])
  
  unless @user.nil? && @user.password != params[:password]
    session[:user] = params[:username]
    redirect '/user_home'
  end
  redirect '/'
end


get '/user_home' do
  unless session[:user].nil?
    erb :user_home
  else
    "OOPs you are not logged in"
  end
end

