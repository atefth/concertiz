class TicketMailer < ApplicationMailer
	default from: 'tickets@concertiz.com'
 
  def booking_confirmation(email, quantity, concert)
    @user = User::find_by_email(email)
    if @user.nil?
    	@user = User.new
    	@user.f_name = "Annonymous"
    	@user.l_name = "User"
    	@user.email = email
    end
    @quantity = quantity
    @concert = concert
    @url  = root_url
    mail(to: @user.email, subject: 'Ticket Reservation At Concertiz')
  end
end
