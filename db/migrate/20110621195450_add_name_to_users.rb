class AddNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :fullname, :string
  end

  def self.down
    remove_column :users, :fullname
    remove_column :users, :name
  end
end
