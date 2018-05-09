class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.time :time, null: false
      t.time :end_time, null: false
      t.string :event_date, null: false
      t.string :location, null: false
      t.integer :position

      t.timestamps
    end
  end
end
