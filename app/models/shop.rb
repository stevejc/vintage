class Shop < ActiveRecord::Base
  attr_accessible :about, :address1, :address2, :city, :image, :name, :state, :stripe_shop_token, :user_id, :zip, :remove_image, :stripe_code, :crop_x, :crop_y, :crop_w, :crop_h
   
  attr_accessor :stripe_code
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  
  after_update :crop_avatar
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  validates :user_id,  presence: true
  validates :name, presence: true, length: { maximum: 140 }
  validates :city, :state, presence: true, length: { maximum: 60 }
  
  def crop_avatar
    image.recreate_versions! if crop_x.present?
  end
  
end
