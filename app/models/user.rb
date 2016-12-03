class User < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  #records = Article.search(query: {match: {_all: {query: 'wold', fuzziness: 2}}}).records

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum student_status: {college_student: "college_student", highschooler: "highschooler"}

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :cell_phone, with: Constants::VALID_PHONE_NUMBER_REGEX, message: "format is invalid.", if: "self.cell_phone.present?"

  validates :phone_call_price, :cell_phone, presence: {message: "must be present if you accept phone calls."}, if: "self.accept_phone_call.present? && self.accept_phone_call == true && self.college_student?", on: :update
  #validates :video_price, presence: {message: "must be present if you accept video calls."}, if: "self.accept_video_call.present? && self.accept_video_call == true", on: :update
  #validates :meeting_price, presence: {message: "must be present if you accept in person meeting."}, if: "self.accept_meeting.present? && self.accept_meeting == true", on: :update

  #since 3 prices are all in same format, we validate them by same regex
  validates_each :phone_call_price, :meeting_price, :video_price do |record, attr, value|
    record.errors.add(attr, ' is invalid, price should be between 0 and 999.99, no dollar sign please.') if value.present? &&  !(value =~ Constants::VALID_US_CURRENCY) && record.college_student?
  end

  scope :with_tags, -> {includes(:tags)}
  scope :college_students, -> {where(student_status: "college_student")}
  scope :highschoolers, -> {where(student_status: "highschooler")}

  before_validation :set_other_prices, on: :update

  def set_other_prices
    if self.phone_call_price.present?
      # convert phone call price to 15 minute rate
      self.phone_call_price = (self.phone_call_price.to_f / 4).round(2)
      # calculate video call price based on incoming phone call price -- only if they select accept_video_call radio box
      self.video_price = (self.phone_call_price.to_f / 0.9).round(2) if self.accept_video_call
      # calculate meeting call price based on incoming phone call price -- only if they select accept_meeting_call radio box
      self.meeting_price = (self.phone_call_price.to_f / 0.8).round(2) if self.accept_meeting
    end
  end

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

  #This is a solution but sometimes use has_many :through would be better
  #has_and_belongs_to_many :tags
  has_many :tags_users
  has_many :tags, through: :tags_users

  # Methods 
  
  def self.permitted(params)
    params.require(:user).permit!
  end

  def display_name
    "#{self.first_name} #{self.last_name}"
  end

  #TODO keep this, may need this later even if it's doing the same thing in carts controller.
  def pay_with_current_bank_or_create(price)
    Stripe.api_key = Constants::STRIPE_API_SECRET_KEY
    if self.stripe_customer_id.blank?
      return false
      # customer = Stripe::Customer.create(
      #     card: token,
      #     description: "#{self.email}-#{self.display_name}",
      #     email: self.email
      # )
      # customer_id = customer.id
    else
      customer_id = self.stripe_customer_id
      Stripe::Charge.create(
          amount: price+100, #Notice that the price need to be at least 50 cents, or it's gonna raise errors. So I will add 100 cents temprorlay here.
          currency: 'usd',
          customer: customer_id
      )
      # save the customer ID in your database so you can use it later
      self.update_column("stripe_customer_id", customer_id)
    end
  end
end
