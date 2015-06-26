class AddRatingToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :rating, :string
  end
end
