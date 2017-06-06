10.times do |i|
  Task.create!(
    id: "i",
    content: "WEB+DB PRESS 9#{i}号を買う",
    status: 0
  )
end
