class UsersController < ApplicationController
  def show
  	# TODO change @essay to @meeting
    @knockee = User.find(params[:id])
    
    #build a new instance of meeting according to the association of user-meeting
    @meeting = @knockee.knocker_meetings.build
  end

  def index
  	# returns 10 users per 'page'  
  	# TODO We should change @esssays to @users
    @essays = User.all.page(params[:page]).per(10)
  end

  def damn_form
    @user = User.find(22)
  end

  def update
    @user = User.find(params[:id])
    @user.update(User::permitted(params))
    redirect_to :back
  end
end
