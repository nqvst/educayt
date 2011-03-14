class RenameColumnInFollowablesToLocalId < ActiveRecord::Migration
  def self.up
    rename_column :followables, :object_id, :local_id
  end

  def self.down
  end
end
