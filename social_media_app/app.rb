require 'sinatra'
require 'sinatra/activerecord'
require_relative 'models/user'
require_relative 'models/post'
require_relative 'models/relationship'

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
  @user = User.find(session[:user])
  if signed_in_user
    erb :user_home
  else
    "OOPs you are not logged in"
  end
end

post '/logout' do
  session[:user] = nil
  redirect '/'
end

post '/create_post' do
  user = User.find(session[:user])
  user.posts.create(content: params[:content])
  redirect '/user_home'
end

get '/manually_test_relationship' do
  "#{User.first.followed_users.inspect}"
end

get '/friend_request' do
  erb :friend_request
end

post '/friend_request' do
  a = User.find(session[:user]).followers 
  a << User.where(id: params[:friend_id]) 
  "You've requested a friend! Their id is #{params[:friend_id]}!"
end

helpers do
  def signed_in_user
    !session[:user].nil?
  end

  def login(username, password)
    user = User.find_by_name(username)

    unless user.nil?
      session[:user] = user.id if user.password == password
    end
  end
end
