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

    # potentialUserArray = Array.new
    # searchArray = params[:term].split(' ');
    # searchArray.each do |term|
    # 	# run the term through a sql search based on if there are any
    # 	# tags that match -- something like
    # 	# tagMatches = Tags.where("name like '%#{term}")
    # 	tag_matches = Tag.where("name LIKE (?)", "%#{term}%")
    # 	tag_matches.each do |tag|
    # 		tag.users.each do |user|
    # 			potentialUserArray.push(user)
    # 		end
    # 	end
    # end
    #
    # # TODO: only show college students
    # # TODO: Calculate Mode
    # @users = Kaminari.paginate_array(potentialUserArray.uniq).page(params[:page]).per(12)
   	# render "users/index"

  end
end
