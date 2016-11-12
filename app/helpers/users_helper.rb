module UsersHelper
	# Returns the full name of the user
	def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  # returns true is student is a college student
  def is_college_student?(user)
    binding.pry;
    # new logic
    # Make this a ternary you meat head
    if (user.student_status == "college_student")
      return true
    else
      return false
    end



    # old logic
    if (user.college)
      return true
    end

  end
end
