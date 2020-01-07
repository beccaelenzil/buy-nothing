class ChangeTypeToStatusInMembers < ActiveRecord::Migration[6.0]
  def change
    rename_column :members, :type, :status
  end
end
