class CreateTableRelationships < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.boolean :confirmed, default: false
      t.timestamps
    end
  end

  def down
    drop_table :relationships
  end
end
