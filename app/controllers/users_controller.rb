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
    @essays = User.all.page(params[:page]).per(10)
  end

  def edit

    @user = User.find(params[:id])
  end

  def update
    @user.update(User::permitted(params))
    redirect_to :back
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
end
