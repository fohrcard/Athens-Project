class AddNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :user, :name, :string
  end
end
