class CreateChoiceCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :choice_collections do |t|

      t.timestamps
    end
  end
end
