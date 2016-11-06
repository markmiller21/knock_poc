class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def upload_essay_form
    if params[:submit_form]
      @essay = User.new(User::permitted(params))
      @essay.save!
    else
      @essay = User.new
    end
  end
end
