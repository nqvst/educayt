class CreateTutorials < ActiveRecord::Migration
  def self.up
    create_table :tutorials do |t|
      t.integer :user_id
      t.integer :category_id
      t.string  :name
      t.string  :description

      t.timestamps
    end
    add_index :tutorials, :user_id
  end

  def self.down
    drop_table :tutorials
  end
end
