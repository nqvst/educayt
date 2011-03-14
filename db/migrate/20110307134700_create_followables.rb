class CreateFollowables < ActiveRecord::Migration
  def self.up
    create_table :followables do |t|
      t.string :type
      t.integer :object_id

      t.timestamps
    end
  end

  def self.down
    drop_table :followables
  end
end
