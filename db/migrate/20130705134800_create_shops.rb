class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.text :about
      t.string :image
      t.string :stripe_shop_token

      t.timestamps
    end
  end
end
