class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :kind
      t.references :discussion

      t.timestamps
    end
    add_index :events, :discussion_id
  end
end
