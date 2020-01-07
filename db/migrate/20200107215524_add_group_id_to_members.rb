class AddGroupIdToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :group_id, :integer
  end
end
