10.times do |i|
  Task.create!(
    content: "WEB+DB PRESS #{i + 1}号を買う",
    status: 0
  )
end
