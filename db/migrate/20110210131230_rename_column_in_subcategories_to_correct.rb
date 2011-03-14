class RenameColumnInSubcategoriesToCorrect < ActiveRecord::Migration
  def self.up
    rename_column :subcategories, :category_id_id, :category_id
  end

  def self.down
  end
end
