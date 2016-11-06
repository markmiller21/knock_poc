class UsersController < ApplicationController
  def show
  	# TODO change @essay to @meeting
    @essay = User.find(params[:id])
    
    #build a new instance of meeting according to the association of user-meeting
    @meeting = @essay.knocker_meetings.build
  end

  def index
  	# returns 10 users per 'page'.  We should change @esssays to @users
    @essays = User.all.page(params[:page]).per(10)
  end
end
