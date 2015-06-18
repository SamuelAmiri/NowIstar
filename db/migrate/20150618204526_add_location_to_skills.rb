class AddLocationToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :address, :string
    add_column :skills, :city, :string
    add_column :skills, :zipcode, :string
    add_column :skills, :state, :string
    add_column :skills, :latitude, :float
    add_column :skills, :longitude, :float
  end
end
