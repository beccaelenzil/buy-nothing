class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :bounds
      t.string :map
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
