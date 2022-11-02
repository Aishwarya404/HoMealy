class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :favorite_cuisine, :string
    add_column :users, :address, :string
  end
end
