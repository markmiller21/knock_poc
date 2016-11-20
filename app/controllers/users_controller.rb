class UsersController < ApplicationController
  before_action :authenticate_user!
  #Other than devise user auth, we must check that the passed params[:id] belongs to
  # the current_user, in case bad guy change the id in the browser URL bar to view or
  # update other user's profile without permission
  before_action :is_current_user?, only: [:update, :edit]

  def show
    @knockee = User.find(params[:id])
    #build a new instance of meeting according to the association of user-meeting
    @meeting = @knockee.knocker_meetings.build
  end

  def index
  	# returns 10 users per 'page'  
  	# TODO We should change @esssays to @users
    @users = User.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(User::permitted(params))
      # this will check if the user filled out price
      if @user.phone_call_price
        @user.accept_video_call = calculate_video_price(@user) if @user.accept_video_call
        @user.accept_meeting = calculate_meeting_price(@user) if @user.accept_meeting
        @user.save
      end
      redirect_to edit_user_path(current_user)
    else
      render :edit
    end
  end

  private
  def is_current_user?
    if params[:id].present?
      @user = User.find(params[:id])
      unless @user.id == current_user.id
        #TODO we need to construct several customized error pages(just html pages and put them to public dir),
        redirect_to edit_user_path(current_user)
      end
    else
      redirect_back fallback_location: root_path
    end
  end

  # This method will calculate the video price based
  # on the inputted call price from the user.  We made a decision
  # for them to set 1 and only 1 price
  def calculate_video_price(user)
    return user.video_price = user.phone_call_price.to_f / 0.9 
  end

  # This method will calculate the meeting price based
  # on the inputted call price from the user.  We made a decision
  # for them to set 1 and only 1 price
  def calculate_meeting_price(user)
    return user.meeting_price = user.phone_call_price.to_f / 0.8
  end
end
