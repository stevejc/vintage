class AddStripeTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_token, :string
    add_column :users, :card_type, :string
    add_column :users, :last4, :string
  end
end
