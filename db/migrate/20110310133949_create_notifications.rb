class CreateNotifications < ActiveRecord::Migration
  def self.up
    create_table :notifications do |t|
      t.integer :updated_object_id
      t.integer :user_id
      t.string :action
      t.integer :followable_id
      t.boolean :viewed

      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
end
