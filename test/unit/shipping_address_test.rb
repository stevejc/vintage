# == Schema Information
#
# Table name: shipping_addresses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address1   :string(255)
#  address2   :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ShippingAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
