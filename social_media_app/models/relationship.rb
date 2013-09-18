class Relationship < ActiveRecord::Base
  belongs_to :befriending, :class_name => 'User', :foreign_key => :created_by_user_id
  belongs_to :befriended, :class_name => 'User', :foreign_key => :created_on_user_id


end

