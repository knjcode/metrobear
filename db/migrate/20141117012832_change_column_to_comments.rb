class ChangeColumnToComments < ActiveRecord::Migration
  def change
    change_column :comments, :content, :string, null: false
    change_column :comments, :content, :string, limit: 400
  end
end
