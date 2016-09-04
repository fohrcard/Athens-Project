5.times do
  pass = Faker::Internet.password
  User.new(email: Faker::Internet.email, password: pass, password_confirmation: pass)
end
