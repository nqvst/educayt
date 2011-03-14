class AddBioToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :bio, :String
  end

  def self.down
    remove_column :users, :bio
  end
end
