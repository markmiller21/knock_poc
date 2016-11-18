class CreateUsersTags < ActiveRecord::Migration[5.0]
  def change
    create_table :users_tags do |t|
    	t.integer :user_id
    	t.integer :tag_id
    end
  end
end
