class AddRegisteredOnJabberToUsers < ActiveRecord::Migration
  def up
    add_column :users, :registered_on_jabber, :boolean, default: false
  end

  def down
    remove_column :users, :registered_on_jabber
  end
end
