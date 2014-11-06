class AddVisitingCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :visiting_count, :integer, :default => 0
  end
end
