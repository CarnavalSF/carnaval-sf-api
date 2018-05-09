class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.string :location

      t.timestamps
    end
  end
end
