class DropGroupsMembers < ActiveRecord::Migration[6.0]
  def change
    drop_table :groups_members
  end
end
