class AddTrophyCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :trophy_count, :integer, :default => 0
  end
end
