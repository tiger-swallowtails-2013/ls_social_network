require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///blog.db"

class User < ActiveRecord::Base
end