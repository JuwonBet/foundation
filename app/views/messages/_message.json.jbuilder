json.extract! message, :id, :content, :acknowledge, :created_at, :updated_at
json.url message_url(message, format: :json)
