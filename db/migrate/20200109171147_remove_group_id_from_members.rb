class RemoveGroupIdFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :group_id
  end
end
