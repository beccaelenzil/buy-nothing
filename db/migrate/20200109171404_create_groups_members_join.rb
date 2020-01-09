class CreateGroupsMembersJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_members do |t|
      t.belongs_to :group, index: true
      t.belongs_to :member, index: true
      t.string :status
    end
  end
end
