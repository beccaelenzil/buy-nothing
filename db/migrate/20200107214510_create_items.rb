class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :type
      t.string :status
      t.string :image_url

      t.timestamps
    end
  end
end
