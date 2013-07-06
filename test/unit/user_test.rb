# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_customer_token  :string(255)
#  card_type              :string(255)
#  last4                  :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
