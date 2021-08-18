class BookingsController < ApplicationController
  before_action :find_booking, only: [ :show, :edit, :update, :destroy ]

  def index
    @bookings = current_user.bookings
  end

  def show
    # @booking = booking.find(params[:id])
  end

  def new
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.status = true
    @booking.user = current_user
    @planet = Planet.find(params[:planet_id])
    @booking.price = (@booking.end_date - @booking.start_date) * @planet.price.to_i
    @booking.planet = @planet
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    # @booking = booking.find(params[:id])
  end

  def update
    # @booking = booking.find(params[:id])
    @booking.update(bookings_params)
    redirect_to bookings_path
  end

  def destroy
    # @booking = booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
