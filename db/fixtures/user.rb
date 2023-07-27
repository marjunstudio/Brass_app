user = User.new(
  id: 1,
  name: "かんりにん",
  email: "admin@gmail.com",
  password: "adminPass01",
  password_confirmation: "adminPass01",
  role: 1
)

existing_user = User.find_by(email: user.email)
if existing_user.nil?
  user.save
end
