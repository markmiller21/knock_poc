class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
    	t.references :knocker_id
		  t.references :knockee_id
		  t.integer :status
		  t.string :description
		  t.float :duration
		  t.float :price 

      t.timestamps
    end
  end
end
