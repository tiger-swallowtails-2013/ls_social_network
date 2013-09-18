class CreateRelationshipsTable < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.integer :created_by_user_id
      t.integer :created_on_user_id
      t.timestamps
    end
  end

  def down
    drop_table :relationships
  end
end
