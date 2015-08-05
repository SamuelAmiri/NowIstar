class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :image
      t.string :email
      t.string :password_digest
      t.boolean :servicer
      t.string :phonenumber
      t.string :street_address
      t.string :city
      t.integer :zipcode
      t.string :state
      t.text :bio

      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps null: false
    end   
      add_index :users, :provider
      add_index :users, :uid
      add_index :users, [:provider, :uid], unique: true

  end
end
