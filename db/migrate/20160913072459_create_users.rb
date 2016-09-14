class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.integer :age
      t.string :birthday
      t.string :gender
      t.string :email
      t.string :address
      t.boolean :activate
      t.string :role

      t.timestamps
    end
  end
end
