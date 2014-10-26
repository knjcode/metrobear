class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider,  :string
    add_column :users, :uid,       :string
    add_column :users, :nickname,  :string
    add_column :users, :image_url, :string

    change_column :users, :provider,  :string, null: false
    change_column :users, :uid,       :string, null: false
    change_column :users, :nickname,  :string, null: false
    change_column :users, :image_url, :string, null: false

    add_index  :users, [:provider, :uid], unique: true
  end
end
