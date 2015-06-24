class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :skills_id
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps null: false
    end
  end
end
