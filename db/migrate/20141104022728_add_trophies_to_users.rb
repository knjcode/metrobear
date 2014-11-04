class AddTrophiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trophies, :text
  end
end
