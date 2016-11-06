class UsersController < ApplicationController
  def show
    @essay = User.find(params[:id])
  end
end
