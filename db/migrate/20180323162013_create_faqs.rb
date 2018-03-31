class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.integer :position

      t.timestamps
    end
  end
end
