class RemoveLocationsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :street_address, :string
    remove_column :users, :city, :string
    remove_column :users, :zipcode, :integer
    remove_column :users, :state, :string
    remove_column :users, :latitude, :float
    remove_column :users, :longitude, :float
  end
end
