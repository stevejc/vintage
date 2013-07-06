# == Schema Information
#
# Table name: line_items
#
#  id            :integer          not null, primary key
#  cart_id       :integer
#  item_id       :integer
#  quantity      :integer          default(1)
#  order_id      :integer
#  shop_id       :integer
#  price         :decimal(, )
#  cart_order_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :item_id
  belongs_to :item
  belongs_to :cart
  belongs_to :order
  has_one :shop, :through => :item
  belongs_to :cart_order
  
  #before_destroy :delete_empty_cart_order
  
  def total_price
    item.price * quantity
  end
  
  def delete_empty_cart_order
    if self.cart_order.line_items.count <= 1
      self.cart_order.destroy
    end
  end
end
