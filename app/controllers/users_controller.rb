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
      if (@user.phone_call_price)
        calculate_prices(@user)
        @user.save
      end
      redirect_to :back
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
        # here we redirect user to an error page like 'You are not authenticated' or 'params error'
      end
    else
      redirect_back fallback_location: root_path
    end
  end

  # This method will calculate the video and meeting price based
  # on the inputted call price from the user.  We made a decision
  # for them to set 1 and only 1 price
  def calculate_prices(user)
    user.video_price = user.phone_call_price.to_f / 0.9 
    user.meeting_price = user.phone_call_price.to_f  / 0.8
  end
end
