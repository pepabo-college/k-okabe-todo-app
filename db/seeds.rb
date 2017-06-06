10.times do |i|
  Task.create!(
    id: i+1,
    content: "WEB+DB PRESS #{i+1}号を買う",
    status: 0
  )
end
