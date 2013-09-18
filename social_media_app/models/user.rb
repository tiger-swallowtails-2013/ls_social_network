class User < ActiveRecord::Base
  has_many :posts

  def self.friends
    self.
  end
end

