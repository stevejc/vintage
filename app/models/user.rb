class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_one :shop, dependent: :destroy
  has_many :items, :through => :shop
  has_many :orders
  has_many :shipping_addresses
  has_many :reviews
  has_many :favorites
  
end
