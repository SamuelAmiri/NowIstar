class CreateSellerReviews < ActiveRecord::Migration
  def change
    create_table :seller_reviews do |t|
      t.references :order, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :text

      t.timestamps null: false
    end
  end
end
