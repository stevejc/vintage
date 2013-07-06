# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :cart_orders, dependent: :destroy
  
  def add_item(item_id)
    current_item = line_items.find_by_item_id(item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(item_id: item_id)
    end
    current_item
  end
  
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end

end
