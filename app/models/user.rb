class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

  #TODO I comment this just for now since we need to let user switch their roles when they signup
  #validates :highschool, presence: true

  ##Carrierwave Uploaders
  mount_uploader :avatar_path, AvatarUploader
  mount_uploader :resume_path, ResumeUploader
  mount_uploader :common_essay_path, CommonEssayUploader
  mount_uploader :college_essay_path, CollegeEssayUploader

  # Associations
  has_many :knockee_meetings, class_name: 'Meeting', foreign_key: 'knockee'
  has_many :knocker_meetings, class_name: 'Meeting', foreign_key: 'knocker'
  has_many :knockee_transactions, class_name: 'Transaction', foreign_key: 'knockee'
  has_many :knocker_transactions, class_name: 'Transaction', foreign_key: 'knocker'

  def self.permitted(params)
    params.require(:user).permit!
  end

  def self.default_avatar_path
    '/images/photos/gu-logo.jpg'
  end

  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
