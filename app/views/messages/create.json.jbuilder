json.message do |json|
  json.body  @message.body
  json.time  @message.created_at
  json.user_name  @message.user.name
end
