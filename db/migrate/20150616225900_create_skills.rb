class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.reference :user
      t.reference :subcategory
      t.decimal :price
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
