class ViewApplicationEssaysController < ApplicationController
  def index
    @essays = User.all.page(params[:page]).per(10)
  end
end
