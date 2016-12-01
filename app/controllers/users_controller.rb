class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #Other than devise user auth, we must check that the passed params[:id] belongs to
  # the current_user, in case bad guy change the id in the browser URL bar to view or
  # update other user's profile without permission
  before_action :is_current_user?, only: [:update, :edit]

  def show
    @knockee = User.find(params[:id])
    #build a new instance of meeting according to the association of user-meeting
    @meeting = @knockee.knocker_meetings.build
  end

  def index
  	# TODO: this should only return college students
    @users = User.college_students.page(params[:page]).per(12)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(User::permitted(params))
      create_tags(@user)
      binding.pry
      if @user.student_status == 'college_student'
        redirect_to user_path(current_user)
      else
        redirect_to users_path()
      end
    else
      render :edit
    end
  end

  private
  # Creates all the tags based on the parameters we want to search by
  # SEARCH PARAMS (activities, bio, highschool, major, college, email)
  # Associates all tags to the user as well
  def create_tags(user)
    potential_tags = @user.bio.split(',').map(&:strip) # bio
    potential_tags.push(@user.activities.split(',').map(&:strip)) # acitivites
    potential_tags.push(@user.highschool) # highschool
    potential_tags.push(@user.college) # college
    potential_tags.push(@user.major) # major
    potential_tags.push(@user.year)
    potential_tags.push(@user.philanthropy)
    potential_tags.push(@user.email).flatten! # email
    potential_tags.select!{|w| w.present? }

    # potential_tags.each do |potential_tag|
    #   added_tags = Tag.find_or_create_by(name: potential_tag)
    #   #unless @user.tags.include?(added_tags)
    #     #@user.tags << added_tags
    #   #end
    #
    #   #the reason why I didn't do @user.tags << added_tags is because I wanna show explicitly that
    #   #this is persisting data to DB by using 'create' keyword.
    #   @user.tags_users.create(tag_id: added_tags.id)
    # end

    ActiveRecord::Base.transaction do
      found = Tag.where(name: potential_tags)
      not_found = potential_tags - found.pluck(:name)
      #now create the tag in 'tags' table
      not_found.map! { |tag| Tag.create(name: tag) }
      #now create record in 'tags_users' table
      (found + not_found).each { |tag_obj| TagsUser.create(user_id: @user.id, tag_id: tag_obj.id) }
    end
  end


  def is_current_user?
    if params[:id].present?
      @user = User.find(params[:id])
      unless @user.id == current_user.id
        #TODO we need to construct several customized error pages(just html pages and put them to public dir),
        redirect_to edit_user_path(current_user)
      end
    else
      redirect_back fallback_location: root_path
    end
  end
end
