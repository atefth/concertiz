class Ticket < ApplicationRecord
	belongs_to :concert
	belongs_to :user

  def purchase concert_id
  	concert = Concert::find(concert_id)
    self.price = concert.ticket_price
    date = concert.date
    time = concert.end_time
    expiry = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
    self.expired = expiry
    self.save!
  end

end
