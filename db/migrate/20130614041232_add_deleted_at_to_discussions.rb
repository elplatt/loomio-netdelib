class AddDeletedAtToDiscussions < ActiveRecord::Migration[5.2]
  def up
    add_column :discussions, :is_deleted, :boolean, :default => false, :null => false
    add_index :discussions, :is_deleted
  end
end
