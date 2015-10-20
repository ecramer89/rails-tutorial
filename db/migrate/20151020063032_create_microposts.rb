class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    #makes it so we will be able to quickly search for microposts by both user and
    #the order of creation (we will be able to return all microposts associated with user_id, in reverse order of creation)
    add_index :microposts, [:user_id, :created_at]
  end
end
