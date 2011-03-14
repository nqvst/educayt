class AddSubcategoryToTutorial < ActiveRecord::Migration
  def self.up
    add_column :tutorials, :subcategory_id, :integer
  end

  def self.down
    remove_column :tutorials, :subcategory_id
  end
end
