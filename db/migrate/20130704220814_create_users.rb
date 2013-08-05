class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :stripe_customer_token
      t.string :card_type
      t.string :last4

      t.timestamps
    end
  end
end
