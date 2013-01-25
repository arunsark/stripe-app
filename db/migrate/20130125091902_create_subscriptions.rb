class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.string :stripe_customer_token
      t.integer :plan_id

      t.timestamps
    end
  end
end
