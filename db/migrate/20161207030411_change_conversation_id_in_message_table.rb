class ChangeConversationIdInMessageTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :conversation_id, :integer
  end
end
