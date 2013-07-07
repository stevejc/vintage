class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :order_id
      t.boolean :positive
      t.text :comment

      t.timestamps
    end
  end
end
