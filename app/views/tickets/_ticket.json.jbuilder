json.extract! ticket, :id, :concert_id, :user_id, :price, :issued, :expired, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)