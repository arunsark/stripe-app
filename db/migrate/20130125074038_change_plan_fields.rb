class ChangePlanFields < ActiveRecord::Migration
  def change
    add_column :plans, :plan_name, :string
    add_column :plans, :amount, :string
    remove_column :plans, :email
    remove_column :plans, :stripe_customer_token
  end
end
