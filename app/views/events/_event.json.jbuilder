json.extract! event, :id, :name, :detail, :start, :created_at, :updated_at
json.url event_url(event, format: :json)
