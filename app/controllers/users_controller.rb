class UsersController < ApplicationController
  def show
    @essay = User.find(params[:id])
    
    #build a new instance of meeting according to the association of user-meeting
    @meeting = @essay.knocker_meetings.build
  end

  def index
    @essays = User.all.page(params[:page]).per(10)
  end
end
