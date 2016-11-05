class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :email, :uniqueness => true, :presence => true

  # Associations
  has_many :knockee_meetings, :class_name => 'Meeting', :foreign_key => 'knockee'
  has_many :knocker_meetings, :class_name => 'Meeting', :foreign_key => 'knocker'

  has_many :knockee_transactions, :class_name => 'Transaction', :foreign_key => 'knockee'
  has_many :knocker_transactions, :class_name => 'Transaction', :foreign_key => 'knocker'
end
