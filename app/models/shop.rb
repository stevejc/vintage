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

class Shop < ActiveRecord::Base
  attr_accessible :about, :address1, :address2, :city, :image, :name, :state, :stripe_shop_token, :user_id, :zip, :remove_image, :stripe_code, :crop_x, :crop_y, :crop_w, :crop_h
   
  attr_accessor :stripe_code
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  after_update :crop_avatar
  
  belongs_to :user
  has_many :items, dependent: :destroy
  
  mount_uploader :image, ImageUploader
  
  validates :user_id,  presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :city, :state, presence: true, length: { maximum: 60 }
  
  def crop_avatar
    image.recreate_versions! if crop_x.present?
  end
  
end
