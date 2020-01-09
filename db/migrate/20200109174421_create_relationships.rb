class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.bigint :group_id
      t.bigint :member_id
      t.string :status

      t.timestamps
    end
  end
end
