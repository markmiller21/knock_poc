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
    # run a mode calculation on this to get the most relevant users to the top

    binding.pry

    # SONG -- I am stuggling here.  I am trying to page the array but I cant seem to get it

    @users = potentialUserArray.limit(24).page(params[:page])
    @users = potentialUserArray.page(params[:page]).per(10)
   	render "users/index"
  end
end
