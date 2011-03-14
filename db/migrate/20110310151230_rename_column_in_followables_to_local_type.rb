class RenameColumnInFollowablesToLocalType < ActiveRecord::Migration
  def self.up
    rename_column :followables, :type, :local_type
  end

  def self.down
    rename_column :followables, :local_type, :type
  end
end
