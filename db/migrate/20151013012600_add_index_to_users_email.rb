class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #rails generated the migration with the appropriate name but did not fill in the contents of the change callback
    #we need to fill it in explicitly. call the ActiveRecord add index method ourselves
    add_index :users, :email
  end
end
