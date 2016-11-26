class Tag < ApplicationRecord
	# Associations
  #Same as in User modal
  #has_and_belongs_to_many :users
  has_many :tags_users
  has_many :users, through: :tags_users

  scope :with_users, -> {includes(:users)}
end
