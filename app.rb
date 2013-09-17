require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:///blog.db"

class User < ActiveRecord::Base
end

# get '/' do 
# 	@users = User.order("name")
# 	erb :"users/index"
# end

# get "/about" do
#   @title = "About Us"
#   erb :"pages/about"
# end

# helpers do
#   # If @title is assigned, add it to the page's title.
#   def title
#     if @title
#       "#{@title} -- My Blog"
#     else
#       "My Blog"
#     end
#   end
 
#   # Format the Ruby Time object returned from a post's created_at method
#   # into a string that looks like this: 06 Jan 2012
#   def pretty_date(time)
#    time.strftime("%d %b %Y")
#   end
 
# end