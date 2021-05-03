class CreateChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :choices do |t|
      t.integer :word_id
      t.text :choices
      t.boolean :correct_ans, null: false, defalut: false

      t.timestamps
    end
  end
end
