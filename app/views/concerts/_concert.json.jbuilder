json.extract! concert, :id, :title, :artist, :location, :start_time, :end_time, :seats, :date, :created_at, :updated_at
json.url concert_url(concert, format: :json)