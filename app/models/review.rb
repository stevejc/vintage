class Review < ActiveRecord::Base
  attr_accessible :comment, :order_id, :positive, :user_id
  
  belongs_to :user
  belongs_to :order
  has_one :shop, :through => :orders
end
