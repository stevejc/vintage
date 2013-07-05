class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :quantity
      t.integer :shop_id
      t.string :status

      t.timestamps
    end
  end
end
