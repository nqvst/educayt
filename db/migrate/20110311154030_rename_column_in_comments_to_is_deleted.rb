class RenameColumnInCommentsToIsDeleted < ActiveRecord::Migration
  def self.up
    rename_column :comments, :deleted, :is_deleted
    remove_column :comments, :title
  end

  def self.down
    rename_column :comments, :is_deleted, :deleted
  end
end
