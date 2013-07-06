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

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
