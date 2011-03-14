class CreateTutorialPartTests < ActiveRecord::Migration
  def self.up
    create_table :tutorial_part_tests do |t|
      t.integer :tutorial_part_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tutorial_part_tests
  end
end
