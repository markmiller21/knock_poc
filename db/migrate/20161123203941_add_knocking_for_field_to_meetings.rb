class AddKnockingForFieldToMeetings < ActiveRecord::Migration[5.0]
  def change
  	add_column :meetings, :knocking_for, :string
  end
end
