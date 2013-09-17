require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///social_media.db"

class User < ActiveRecord::Base
  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :user
end

get '/' do
  @user = User.first
  erb :sign_in
end

