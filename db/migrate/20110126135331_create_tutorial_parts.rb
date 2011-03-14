class CreateTutorialParts < ActiveRecord::Migration
  def self.up
    create_table :tutorial_parts do |t|
      t.integer :tutorial_id
      t.string :title
      t.string :description
      t.text :content_text
      t.integer :in_order

      t.timestamps
    end
    add_index :tutorial_parts, :tutorial_id
  end

  def self.down
    drop_table :tutorial_parts
  end
end
