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

class ShippingAddress < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :state, :zip
  
  has_one :user
  has_many :orders,  :through => :users
  
  #validates :address1, :city, :name, :state, :zip,  presence: true
end
