class AddIndexToMembershipRequests < ActiveRecord::Migration[5.2]
  def change
    add_index :membership_requests, [:group_id, :response]
  end
end
