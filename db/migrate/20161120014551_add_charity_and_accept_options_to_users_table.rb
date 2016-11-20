class AddCharityAndAcceptOptionsToUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :philanthropy_percent, :float, default: 5.0
    #calculated money that knockee donated
    add_column :users, :total_money_donated, :decimal, precision: 8, scale: 2, default: 0.00
    #name of the charity
    add_column :users, :philanthropy, :string, default: "Georgetown University Endowment"
    #accpet_*** options
    add_column :users, :accept_phone_call, :boolean, default: true
    add_column :users, :accept_video_call, :boolean, default: true
    add_column :users, :accept_meeting, :boolean, default: true
    #money that go to philanthropy and not going to knockees
    add_column :transactions, :money_for_philanthropy, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
