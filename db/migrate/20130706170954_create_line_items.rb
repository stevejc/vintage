class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity, default: 1
      t.integer :order_id
      t.integer :shop_id
      t.decimal :price
      t.integer :cart_order_id

      t.timestamps
    end
  end
end
