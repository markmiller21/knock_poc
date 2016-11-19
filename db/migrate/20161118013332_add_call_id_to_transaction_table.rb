class AddCallIdToTransactionTable < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :meeting_id, :integer
  end
end
