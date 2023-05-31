user = User.new(
  id: 1,
  name: "かんりにん",
  email: "admin@kanri.com",
  password: "admin",
  password_confirmation: "admin",
  role: 1
)

user.save!
