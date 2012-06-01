json.array!(posts) do |json, post|
  json.user post.user.name
  json.message post.message
  json.posted post.created_at
end