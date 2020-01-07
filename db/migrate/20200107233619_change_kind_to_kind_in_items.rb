class ChangeKindToKindInItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :kind, :type_of
  end
end
