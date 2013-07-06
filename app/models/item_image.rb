class ItemImage < ActiveRecord::Base
  attr_accessible :image, :order, :item_id, :remove_image
  belongs_to :item

  before_destroy :update_item_status_if_no_images
  before_create :add_image_order

  validates :item_id,  presence: true
  validates :image, presence: true
  validate :limit_number_of_images

  mount_uploader :image, PikUploader

  def limit_number_of_images
    if self.item.item_images.size > 4
      errors.add(:base, "Exceeded limit of 5 images per item")
    end
  end

  def update_item_status_if_no_images
    if self.item.item_images.size == 1
      self.item.status = "Pending"
      self.item.save
    end
  end

  def add_image_order
    self.order = (self.item.item_images.size) + 1
  end

end
