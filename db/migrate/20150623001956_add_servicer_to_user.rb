class AddServicerToUser < ActiveRecord::Migration
  def change
    add_column :users, :servicer, :boolean
  end
end
