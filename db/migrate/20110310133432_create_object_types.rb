class CreateObjectTypes < ActiveRecord::Migration
  def self.up
    create_table :object_types do |t|
      t.string :type_name

      t.timestamps
    end
  end

  def self.down
    drop_table :object_types
  end
end
