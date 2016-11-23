class TagsController < ApplicationController
  #TODO we just need this for test, will remove afer we launch
  skip_before_action :verify_authenticity_token
  def search
    term = params[:term]
    if term.present?
      where = term.split(" ").map{|key_word| "activities LIKE '%#{key_word}%' OR college LIKE '%#{key_word}%' OR major LIKE '%#{key_word}%' OR tags.name LIKE '%#{key_word}%'" }.join(" OR ")
      @users = User.joins("LEFT JOIN tags_users ON tags_users.user_id = users.id LEFT JOIN tags ON
 tags.id = tags_users.tag_id").where(where).uniq.page(params[:page]).per(10)
    else
      @users = USer.all.page(params[:page]).per(10)
    end
    render "users/index"
  end
end
