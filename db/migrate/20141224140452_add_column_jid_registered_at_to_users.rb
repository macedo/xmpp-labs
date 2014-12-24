class AddColumnJidRegisteredAtToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :registered_on_jabber
    add_column :users, :registered_on_jabber_at, :datetime, default: :null
  end

  def down
    add_column :users, :registered_on_jabber, :boolean, default: :false
    remove_column :users, :registered_on_jabber_at
  end
end
