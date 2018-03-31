class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :time, null: false
      t.string :location, null: false
      t.integer :position
      t.string :image_data

      t.timestamps
    end
  end
end
