class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.references :user, index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true
      t.decimal :price
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
