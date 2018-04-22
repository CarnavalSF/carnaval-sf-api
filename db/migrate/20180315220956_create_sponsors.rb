class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :logo_data
      t.string :name, null: false
      t.string :website, null: false
      t.boolean :featured
      t.integer :position

      t.timestamps
    end
  end
end
