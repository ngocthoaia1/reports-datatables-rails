20.times do |i|
  User.create!(name: "User #{i}", phone: 161616161 + i, address: "address #{i}")
end