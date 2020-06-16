class BookingsController < ApplicationController
  before_action :set_ship, only: [:new, :create]

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.ship = @ship
    if @booking.save
      redirect_to ship_bookings_path(@ship)
    else
      render :new
  end

  private

  def set_ship
    @ship = Ship.find(params[:ship_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
