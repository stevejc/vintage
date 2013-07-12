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
  attr_accessible :description, :price, :quantity, :status, :title
  scope :available, where(:status => "Available")
  
  belongs_to :shop
  has_many :item_images, dependent: :destroy
  has_many :line_items
  has_many :favorites
  has_many :reviews, :through => :shop
  
  delegate :name, :city, :state, :image, :to => :shop, :prefix => true
  
  before_create :update_item_status_to_pending
  
  validates :shop_id,  presence: true
  validates :quantity, :title, :description, :price, presence: true
  
  def self.text_search(query)
    if query.present?
      where("title @@ :q or description @@ :q", q: query).available
    else
      scoped.available
    end
  end
  
  def other_items_from_this_shop
    shop.items.where('id != ? AND status = ?', self.id, "Available").limit(3)
  end
  
  def my_favorite?(user)
    Favorite.where('item_id = ? AND user_id = ?', self.id, user).exists?  
  end
  
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
