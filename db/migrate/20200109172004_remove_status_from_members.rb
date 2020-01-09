class RemoveStatusFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :status
  end
end
