class AddMeetingIdToMessagesTable < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :meeting_id, :integer
  end
end
