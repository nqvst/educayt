class CreateUpdatedObjects < ActiveRecord::Migration
  def self.up
    create_table :updated_objects do |t|
      t.string :object_type_id
      t.integer :local_id

      t.timestamps
    end
  end

  def self.down
    drop_table :updated_objects
  end
end
