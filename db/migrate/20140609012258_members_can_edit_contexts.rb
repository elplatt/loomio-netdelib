class MembersCanEditContexts < ActiveRecord::Migration[5.2]
  def up
    add_column :groups, :members_can_edit_discussions, :boolean, default: true, null: false
  end

  def down
    remove_column :groups, :members_can_edit_discussions
  end
end
