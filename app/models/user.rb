class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  ##Carrierwave Uploaders
  # mount_uploader :avatar_path, AvatarUploader
  # mount_uploader :resume_path, ResumeUploader
  # mount_uploader :common_essay_path, CommonEssayUploader
  # mount_uploader :college_essay_path, CollegeEssayUploader

  # Associations
  has_many :knockee_meetings, :class_name => 'Meeting', :foreign_key => 'knockee'
  has_many :knocker_meetings, :class_name => 'Meeting', :foreign_key => 'knocker'

  has_many :knockee_transactions, :class_name => 'Transaction', :foreign_key => 'knockee'
  has_many :knocker_transactions, :class_name => 'Transaction', :foreign_key => 'knocker'

  def self.permitted(params)
    params.require(:user).permit!
  end
end
