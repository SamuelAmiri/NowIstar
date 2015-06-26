class AddReviewtoOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :review_buyer, :text
  	add_column :orders, :review_seller, :text
  end
end
