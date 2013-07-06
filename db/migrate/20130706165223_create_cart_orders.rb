class CreateCartOrders < ActiveRecord::Migration
  def change
    create_table :cart_orders do |t|
      t.integer :cart_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
