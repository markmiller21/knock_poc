# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mark = User.new(:email => "mark@gmail.com", :password => 'password', :password_confirmation => 'password', :first_name => 'Mark', :last_name => 'Miller', :student_status => 'College', :activities => 'Football, Chess Team, Basketball, and Entrepreneurship', :personal_description => 'Great guy with a better personality', :philanthropy_percent => 21.12, :cell_phone => '2024365781', :school => 'Salisbury School', :major => 'Quantitative Finance', :phone_call_price => 50, :avaliability => 'Afternoons 6 PM - 9 PM', :meeting_price => 50, :video_price => 50, :venmo => 'markmiller21', :avatar_path => '', :resume_path => '' , :common_essay_path => '', :college_essay_path => '')
mark.save

ryan = User.new(:email => "ryan@georgetown.edu", :password => 'password', :password_confirmation => 'password', :first_name => 'Mark', :last_name => 'Merlini', :student_status => 'College', :activities => 'Football, Chess Team, Basketball, and Entrepreneurship', :personal_description => 'Great guy with a better personality', :philanthropy_percent => 21.12, :cell_phone => '2024365781', :school => 'Salisbury School', :major => 'Quantitative Finance', :phone_call_price => 50, :avaliability => 'Afternoons 6 PM - 9 PM', :meeting_price => 50, :video_price => 50, :venmo => 'ryanMerlini', :avatar_path => '', :resume_path => '' , :common_essay_path => '', :college_essay_path => '')
ryan.save

song = User.new(:email => "yu.song@georgetown.edu", :password => 'password', :password_confirmation => 'password', :first_name => 'Mark', :last_name => 'Merlini', :student_status => 'College', :activities => 'Football, Chess Team, Basketball, and Entrepreneurship', :personal_description => 'Great guy with a better personality', :philanthropy_percent => 21.12, :cell_phone => '2024365781', :school => 'Salisbury School', :major => 'Quantitative Finance', :phone_call_price => 50, :avaliability => 'Afternoons 6 PM - 9 PM', :meeting_price => 50, :video_price => 50, :venmo => 'yuSong', :avatar_path => '', :resume_path => '' , :common_essay_path => '', :college_essay_path => '')
song.save

yahya = User.new(:email => "yahya@georgetown.edu", :password => 'password', :password_confirmation => 'password', :first_name => 'Mark', :last_name => 'Merlini', :student_status => 'College', :activities => 'Football, Chess Team, Basketball, and Entrepreneurship', :personal_description => 'Great guy with a better personality', :philanthropy_percent => 21.12, :cell_phone => '2024365781', :school => 'Salisbury School', :major => 'Quantitative Finance', :phone_call_price => 50, :avaliability => 'Afternoons 6 PM - 9 PM', :meeting_price => 50, :video_price => 50, :venmo => 'yayaya', :avatar_path => '', :resume_path => '' , :common_essay_path => '', :college_essay_path => '')
yahya.save
