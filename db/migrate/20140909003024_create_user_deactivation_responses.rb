class CreateUserDeactivationResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_deactivation_responses do |t|
      t.references :user, index: true
      t.text :body
    end
  end
end
