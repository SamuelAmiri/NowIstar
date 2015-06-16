class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.reference :category

      t.timestamps null: false
    end
  end
end
