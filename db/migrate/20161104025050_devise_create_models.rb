class DeviseCreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.string :first_name
      t.string :last_name
      t.string :student_status
      t.string :activities
      t.string :personal_description
      t.float :philanthropy_percent
      t.string :cell_phone
      t.string :school
      t.string :major
      t.float :phone_call_price
      t.string :avaliability
      t.float :meeting_price
      t.float :video_price
      t.string :venmo
      t.string :avatar_path
      t.string :resume_path
      t.string :common_essay_path
      t.string :college_essay_path

      t.timestamps null: false
    end

    add_index :models, :email,                unique: true
    add_index :models, :reset_password_token, unique: true
    # add_index :models, :confirmation_token,   unique: true
    # add_index :models, :unlock_token,         unique: true
  end
end
