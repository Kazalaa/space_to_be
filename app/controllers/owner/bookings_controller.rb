class Owner::BookingsController < ApplicationController

  def index
    @bookings = []
    current_user.planets.each do |planet|
      planet.bookings.each do |booking|
        @bookings << booking
      end
    end
  end

  def new
    # @planet = Planet.new
    # @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(bookings_params)
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def bookings_params
    params.require(:bookings).permit(:status, :price)
  end

end
