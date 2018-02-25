class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string :name
      t.text :description
      t.integer :topic_id

      t.timestamps null: false
    end
  end
end
