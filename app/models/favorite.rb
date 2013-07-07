class Favorite < ActiveRecord::Base
  attr_accessible :item_id, :user_id
  belongs_to :user
  belongs_to :item
  
  validates :user_id, :item_id,  presence: true
  validate :only_one_fav_per_item_user
  
  def only_one_fav_per_item_user
    if Favorite.where('item_id = ? AND user_id = ?', self.item_id, self.user_id).exists?
      errors.add(:base, "Can only favorite an item once.")
    end
  end
end
