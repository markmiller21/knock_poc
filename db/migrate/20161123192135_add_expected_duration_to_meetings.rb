class AddExpectedDurationToMeetings < ActiveRecord::Migration[5.0]
  def change
  	add_column :meetings, :expected_duration, :string
  end
end
