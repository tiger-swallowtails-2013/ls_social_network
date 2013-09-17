class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.timestamps
    end

  User.create(name: "Juke")
  User.create(name: "Daniel")
  end

  def down
    drop_table :users
  end
end
