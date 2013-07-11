class Review < ActiveRecord::Base
  attr_accessible :comment, :order_id, :positive, :user_id
  
  belongs_to :user
  belongs_to :order
  has_one :shop, :through => :orders
  
  validates :order_id, :user_id, :comment,  presence: true
  validates :positive, :inclusion => {:in => [true, false],
                       :message => "Don't forget to check positive or negative" }

end
