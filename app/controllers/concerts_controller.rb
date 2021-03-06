class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy, :book]

  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = Concert.all
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def book
    count = 0
    quantity = concert_params[:quantity].to_i
    if current_user.nil?
      if concert_params[:email].nil? || concert_params[:email] == ""
        flash[:notice] = "Please Provide An Email Address To Book Tickets!"
        redirect_to '/home/concerts'
      else
        ActiveRecord::Base.transaction do
          while count < quantity do
            Ticket.create([concert_id: @concert.id, user_id: concert_params[:email]])
            count += 1
          end
          TicketMailer.booking_confirmation(concert_params[:email], quantity, @concert).deliver_now
        end
        flash[:notice] = "Tickets Booked Successfully!"
        redirect_to '/home/index'
      end
    else
      ActiveRecord::Base.transaction do
        while count < quantity do
          Ticket.create([concert_id: @concert.id, user_id: current_user.id])
          count += 1
        end
        TicketMailer.booking_confirmation(current_user.email, quantity, @concert).deliver_now
      end
      flash[:notice] = "Tickets Booked Successfully!"
      redirect_to '/home/index'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params.fetch(:concert, {}).permit(:title, :artist, :location, :start_time, :end_time, :seats, :ticket_price, :date, :quantity, :email)
    end
end
