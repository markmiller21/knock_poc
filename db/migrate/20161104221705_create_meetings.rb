class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
    	
		  t.references :knockee_id
		  t.references :knocker_id
    	t.integer :type
		  t.string :meeting_time # this could change
		  t.float :meeting_price
		  t.integer :status
		  t.string :reject_reasons
		  t.string :reschedule_time

      t.timestamps
    end
  end
end
