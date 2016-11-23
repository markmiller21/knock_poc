class TagsController < ApplicationController
  #TODO we just need this for test, will remove afer we launch
  skip_before_action :verify_authenticity_token
  def search
  	potentialUserArray = Array.new
    searchArray = params[:term].split(' ');
    searchArray.each do |term|
    	# run the term through a sql search based on if there are any
    	# tags that match -- something like 
    	# tagMatches = Tags.where("name like '%#{term}")
    	tagMatches.each do |tag|
    		potentialUserArray = tag.users
    	end
    end
    binding.pry



    @users = User.joins("LEFT JOIN tags_users ON tags_users.user_id = users.id LEFT JOIN tags ON
 tags.id = tags_users.tag_id").where("activities LIKE '%#{term}%' OR college LIKE '%#{term}%' OR major LIKE '%#{term}%' OR tags.name LIKE '%#{term}%'").page(params[:page]).per(10)
    render "users/index"
  end
end
