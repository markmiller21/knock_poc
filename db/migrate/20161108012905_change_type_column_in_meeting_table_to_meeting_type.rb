class ChangeTypeColumnInMeetingTableToMeetingType < ActiveRecord::Migration[5.0]
  def change
    rename_column :meetings, :type, :meeting_type
  end
end
