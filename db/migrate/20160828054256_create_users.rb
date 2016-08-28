class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true, index: true
      t.string :password_digest
      t.string :age
      t.string :country
      t.string :gender
      t.integer :flag

      t.timestamps
    end
  end
end
