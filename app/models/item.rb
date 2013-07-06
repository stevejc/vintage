# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  price       :decimal(, )
#  quantity    :integer
#  shop_id     :integer
#  status      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
  attr_accessible :description, :price, :quantity, :shop_id, :status, :title
  
  belongs_to :shop
  has_many :item_images, dependent: :destroy
  
  before_create :update_item_status_to_pending
  
  validates :shop_id,  presence: true
  validates :quantity, :title, :description, :price, presence: true
  
  def update_status_to_available
    if quantity >= 1 && item_images.exists?
      self.status = "Available"
      self.save
    end
  end
  
  private
    
    def update_item_status_to_pending
      self.status = "Pending"
    end
  
  
end
