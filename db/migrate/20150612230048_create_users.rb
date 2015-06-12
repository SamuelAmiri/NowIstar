class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :picture
      t.string :email
      t.string :password_digest
      t.boolean :provider
      t.integer :phonenumber
      t.string :street_address
      t.string :city
      t.integer :zipcode
      t.string :state
      t.text :bio

      t.timestamps null: false
    end
  end
end
