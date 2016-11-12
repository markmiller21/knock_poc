class ChangePriceToStringType < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phone_call_price, :string
    change_column :users, :meeting_price, :string
    change_column :users, :video_price, :string
  end
end
