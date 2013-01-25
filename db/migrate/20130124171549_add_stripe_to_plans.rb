class AddStripeToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :stripe_customer_token, :string
  end
end
