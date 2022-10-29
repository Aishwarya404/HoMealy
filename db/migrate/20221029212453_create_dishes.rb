class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :dishname
      t.string :user_email
      t.float :price
      t.integer :quantity
      t.string :cuisine
      t.string :description
    end
  end
end
