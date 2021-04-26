class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :description

      t.timestamps
    end

    create_table :words do |t|
      t.belongs_to :category
      t.integer :category_id

      t.timestamps
    end

  end
end
