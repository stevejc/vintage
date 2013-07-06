# == Schema Information
#
# Table name: orders
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  shop_id             :integer
#  shipping_address_id :integer
#  carrier             :string(255)
#  tracking_number     :string(255)
#  ship_date           :date
#  status              :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
