class UsersController < ApplicationController
  def show
    @essay = User.find(params[:id])
    @call = @essay.knocker_meetings.build
    @meeting = @essay.knocker_meetings.build
  end

  def index
    @essays = User.all.page(params[:page]).per(10)
  end
end
