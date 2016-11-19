class TagsController < ApplicationController
  #TODO we just need this for test, will remove afer we launch
  skip_before_action :verify_authenticity_token
  def search
    term = params[:term]
    @users = User.joins("LEFT JOIN tags_users ON tags_users.user_id = users.id LEFT JOIN tags ON
 tags.id = tags_users.tag_id").where("activities LIKE '%#{term}%' OR college LIKE '%#{term}%' OR major LIKE '%#{term}%' OR tags.name LIKE '%#{term}%'").page(params[:page]).per(10)
    render "users/index"
  end
end
