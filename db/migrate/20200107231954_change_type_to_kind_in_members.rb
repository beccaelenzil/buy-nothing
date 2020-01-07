class ChangeTypeToKindInMembers < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :type, :kind
  end
end
