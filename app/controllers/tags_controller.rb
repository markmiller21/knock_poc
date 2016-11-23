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
    	tag_matches = Tag.where("name LIKE (?)", "%#{term}%")
    	tag_matches.each do |tag|
    		tag.users.each do |user|
    			potentialUserArray.push(user)
    		end
    	end
    end

    # TODO: only show college students
    # TODO: Calculate Mode
    @users = Kaminari.paginate_array(potentialUserArray.uniq).page(params[:page]).per(12)
   	render "users/index"
  end
end
