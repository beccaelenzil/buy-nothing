class AddMemberIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :member_id, :integer
  end
end
