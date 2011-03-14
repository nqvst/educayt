class CreateCommentables < ActiveRecord::Migration
  def self.up
    create_table :commentables do |t|
      t.integer :object_type_id
      t.integer :local_id

      t.timestamps
    end
  end

  def self.down
    drop_table :commentables
  end
end
