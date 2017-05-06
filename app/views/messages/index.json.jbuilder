json.set! :messages do
  json.array! @defferent_messages do |message|
    json.id    message.id
    json.body  message.body
    json.time  message.created_at.strftime("%Y/%m/%d %H:%M:%S")
    json.user_name message.user.name
    json.image message.image.url
  end
end
