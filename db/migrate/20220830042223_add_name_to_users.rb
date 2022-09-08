class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profession, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :user_image, :string
    add_column :users, :id_image, :string
    add_column :users, :id_number, :string
  end
