
User.destroy_all

# User.create(
#   id: 12, 
#   email: "rgm56@georgetown.edu", 
#   password: "123123123",
#   first_name: "Ryan", 
#   last_name: "Merlini", 
#   student_status: "college_student",
#   cell_phone: "2156920921", 
#   phone_call_price: 25.00, 
#   meeting_price: 20.00, 
#   video_price: 15.00,
#   avatar_path: 'big_smile.jpg', 
#   resume_path: 'resume.txt', 
#   common_essay_path: "common_college_essay.txt",
#   college_essay_path: "application_essay.txt"
# )

# User.create(id: 13,
#   email: "terrorgeek@gmail.com",
#   password: "123123123",
#   first_name: "Yu",
#   last_name: "Song",
#   student_status: "college_student",
#   cell_phone: "2028129585",
#   phone_call_price: 15.00,
#   meeting_price: 20.00,
#   video_price: 15.00,
#   avatar_path: 'norah.png',
#   resume_path: 'resume.txt',
#   common_essay_path: "common_college_essay.txt",
#   college_essay_path: "application_essay.txt"
# )

# User.create(id: 14,
#   email: "mark.kilpatrick.miller@gmail.com",
#   password: "123123123",
#   first_name: "Mark",
#   last_name: "Miller",
#   student_status: "college_student",
#   cell_phone: "2024365781",
#   phone_call_price: 12.56,
#   meeting_price: 20.00,
#   video_price: 15.00,
#   avatar_path: 'ivy.png',
#   resume_path: 'resume.txt',
#   common_essay_path: "common_college_essay.txt",
#   college_essay_path: "application_essay.txt"
# )

# User.create(id: 15,
#  email: "joe@georgetown.edu",
#  password: "123123123",
#  first_name: "Joe",
#  last_name: "Devito",
#  student_status: "college_student",
#  cell_phone: "2156920921",
#  phone_call_price: 12.56,
#  meeting_price: 20.00,
#  video_price: 15.00,
#  avatar_path: 'big_smile.jpg',
#  resume_path: 'resume.txt',
#  common_essay_path: "common_college_essay.txt",
#  college_essay_path: "application_essay.txt"
# )

# User.create(id: 16,
#  email: "kat@georgetown.edu",
#  password: "123123123",
#  first_name: "Kat",
#  last_name: "Marry",
#  student_status: "college_student",
#  cell_phone: "2156920921",
#  phone_call_price: 12.56,
#  meeting_price: 20.00,
#  video_price: 15.00,
#  avatar_path: 'joe.png',
#  resume_path: 'resume.txt',
#  common_essay_path: "common_college_essay.txt",
#  college_essay_path: "application_essay.txt"
# )

# User.create(id: 17,
#  email: "gavin@georgetown.edu",
#  password: "123123123",
#  first_name: "Gavin",
#  last_name: "Nanini",
#  student_status: "college_student",
#  cell_phone: "2156920921",
#  phone_call_price: 12.56,
#  meeting_price: 20.00,
#  video_price: 15.00,
#  avatar_path: 'joe.png',
#  resume_path: 'resume.txt',
#  common_essay_path: "common_college_essay.txt",
#  college_essay_path: "application_essay.txt"
# )

# User.create(id: 18,
#  email: "gretta@georgetown.edu",
#  password: "123123123",
#  first_name: "Gretta",
#  last_name: "Goods",
#  student_status: "college_student",
#  cell_phone: "2156920921",
#  phone_call_price: 12.56,
#  meeting_price: 20.00,
#  video_price: 15.00,
#  avatar_path: 'gavin.png',
#  resume_path: 'resume.txt',
#  common_essay_path: "common_college_essay.txt",
#  college_essay_path: "application_essay.txt"
#  )

# User.create(id: 20,
#  email: "michael@georgetown.edu",
#  password: "123123123",
#  first_name: "Michael",
#  last_name: "Jordan",
#  student_status: "college_student",
#  cell_phone: "2156920921",
#  phone_call_price: 12.56,
#  meeting_price: 20.00,
#  video_price: 15.00,
#  avatar_path: 'michael.png',
#  resume_path: 'resume.txt',
#  common_essay_path: "common_college_essay.txt",
#  college_essay_path: "application_essay.txt"
# )

mark = User.new(:email => "mark.kilpatrick.miller@gmail.com", 
  bio: 'surving the QFIN program at JMU',
  password: 'password', 
  password_confirmation: 'password', 
  username: 'markmiller',
  first_name: 'Mark', 
  last_name: 'Miller', 
  student_status: 'college_student', 
  activities: 'Football, Chess Team, Basketball, and Entrepreneurship', 
  personal_description: 'Great guy with a better personality', 
  cell_phone: '2024365781', 
  highschool: 'Salisbury School', 
  college: 'James Madison University',
  major: 'Quantitative Finance', 
  avaliability: 'Afternoons 6 PM - 9 PM', 
  phone_call_price:  25.00,
  meeting_price:  20.00, 
  video_price:  15.00, 
  venmo: 'markmiller21', 
  resume_path: '' , 
  common_essay_path: '', 
  college_essay_path: ''
)
# mark.avatar_path = File.open(File.expand_path('../fixtures/mark_knock.png', __FILE__))
mark.save


ryan = User.new(:email => "ryan@georgetown.edu", 
  bio: 'Georgetown advice, financial consulting',
  password: 'password', 
  password_confirmation: 'password', 
  first_name: 'Mark', 
  last_name: 'Merlini', 
  student_status: 'college_student', 
  activities: 'Football, Chess Team, Basketball, and Entrepreneurship', 
  personal_description: 'Would love to chat about Georgetown',
  cell_phone: '2024365781', 
  college: 'Georgetown',
  highschool: 'Upper Dublin',
  major: 'Economics', 
  phone_call_price: 25.00,
  meeting_price: 20.00, 
  video_price: 15.00, 
  venmo: 'ryanMerlini', 
  resume_path: '' , 
  common_essay_path: '', 
  college_essay_path: ''
)
# ryan.avatar_path = File.open(File.expand_path('../fixtures/ryan_knock.png', __FILE__))
ryan.save

song = User.new(:email => "terrorgeek@gmail.com", 
  bio: 'Advice on CS program',
  password: 'password', 
  password_confirmation: 'password', 
  first_name: 'Yu', 
  last_name: 'Song', 
  student_status: 'college_student', 
  activities: 'Football, Chess Team, Basketball, and Entrepreneurship', 
  personal_description: 'Do you love ruby as much as me?', 
  cell_phone: '2024365782', 
  highschool: 'Salisbury School', 
  college: 'University of Virginia',
  major: 'Computer Science', 
  phone_call_price: 25.00,
  meeting_price: 20.00, 
  video_price: 15.00, 
  venmo: 'yuSong', 
  resume_path: '' , 
  common_essay_path: '', 
  college_essay_path: ''
)
# song.avatar_path = File.open(File.expand_path('../fixtures/song_knock.png', __FILE__))
song.save

yahya = User.new(:email => "yahya@georgetown.edu", 
  bio: 'Entrepreneurship advice',
  password: 'password', 
  password_confirmation: 'password', 
  first_name: 'Yahya', 
  last_name: 'Asfoor', 
  student_status: 'college_student', 
  activities: 'Football, Chess Team, Basketball, and Entrepreneurship', 
  personal_description: 'Entrepreneurship is my passion', 
  philanthropy_percent: 21.12, 
  cell_phone: '2024365780', 
  highschool: 'Salisbury School',
  college: 'George Washington University',
  major: 'Finance', 
  phone_call_price: 25.00,
  meeting_price: 20.00, 
  video_price: 15.00, 
  venmo: 'yayaya', 
  resume_path: '' , 
  common_essay_path: '', 
  college_essay_path: ''
)
# yahya.avatar_path = File.open(File.expand_path('../fixtures/yahya_knock.png', __FILE__))
yahya.save

