class Message < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  scope :with_user, -> {includes(:user)}
end
