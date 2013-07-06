class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :shop_id
      t.integer :shipping_address_id
      t.string :carrier
      t.string :tracking_number
      t.date :ship_date
      t.string :status

      t.timestamps
    end
  end
end
