class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :email
      t.timestamps
    end
  end
end
