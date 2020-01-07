class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email
      t.string :username
      t.string :first
      t.string :last
      t.string :type

      t.timestamps
    end
  end
end
