json.points @points do |point|
  json.id             point.id
  json.name           point.name
  json.link           point.link
  json.state          point.state
  json.region         point.region
  json.locality       point.locality
  json.lat            point.lat
  json.lng            point.lng
  json.start          point.start
  json.target         point.target
  json.duration       point.duration
  json.elevationdiff  point.elevationdiff
  json.height         point.height
  json.slug           point.slug
  json.difficulty     point.difficulty

  json.comments point.comments, :id, :text, :created_at, :user_name
end
