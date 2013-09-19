require_relative "../../app"
require "rspec"
require 'rack'
require 'rack/test'

def app
    Sinatra::Application
end

describe "create user", :type => :controller do
  include Rack::Test::Methods
  it "adds user to database" do
    test_user = User.create(name: 'Test', email: 'test@test.com', password: 'test')
    User.last.name.should eql "Test"
  end
  User.last.delete

  it "create user with password in front-end" do
    post '/sign_up', params={:name => 'Test1', :email => 'test@test.com', :password => 'test'} 
    User.last.name.should eql 'Test1'
  end
end


# describe "confirm session functionality" do
#   it ""
