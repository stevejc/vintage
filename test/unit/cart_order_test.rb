# == Schema Information
#
# Table name: cart_orders
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  shop_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CartOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
