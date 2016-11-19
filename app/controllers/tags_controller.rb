class TagsController < ApplicationController
  #TODO we just need this for test, will remove afer we launch
  skip_before_action :verify_authenticity_token
  def search
    term = params[:term]
    binding.pry
    @users = (User.where("activities LIKE '%#{term}%' OR college LIKE '%#{term}%' OR major LIKE '%#{term}%'") + User.joins(:tags).where("name LIKE '#{term}%'")).page(params[:page]).per(10)
    render "users/index"
  end
end
