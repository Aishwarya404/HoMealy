class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, {:id => false} do |t|
      t.string :email, primary_key: true
      t.string :password_digest
      t.string :name
      t.string :zipcode
    end
  end
end
