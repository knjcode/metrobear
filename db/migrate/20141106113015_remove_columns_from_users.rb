class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :name, :string
    remove_column :users, :email, :string
    remove_column :users, :password_digest, :string
    remove_column :users, :remember_token, :string
  end
end
