class UpdateTutorialPartTests < ActiveRecord::Migration
  def self.up
    rename_column(:tutorial_part_tests, :tutorial_part_id, :tutorial_id)
  end

  def self.down
    rename_column(:tutorial_part_id, :tutorial_part_tests, :tutorial_id)
  end
end
