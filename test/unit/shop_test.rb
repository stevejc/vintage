# == Schema Information
#
# Table name: shops
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  name              :string(255)
#  address1          :string(255)
#  address2          :string(255)
#  city              :string(255)
#  state             :string(255)
#  zip               :string(255)
#  about             :text
#  image             :string(255)
#  stripe_shop_token :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
