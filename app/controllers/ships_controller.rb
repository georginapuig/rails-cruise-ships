class ShipsController < ApplicationController
  before_action :set_ship, only: [:show, :edit, :update, :destroy]

  def index
    @ships = Ship.geocoded # returns ships with coordinates

    @markers = @ships.map do |ship|
      {
        lat: ship.latitude,
        lng: ship.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { ship: ship }),
        image_url: helpers.asset_url('pin.png')
      }
    end
  end

  def new
    @ship = Ship.new
  end

  def create
    @ship = Ship.new(ship_params)
    @ship.user = current_user
    if @ship.save
      redirect_to ship_path(@ship)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ship.update(ship_params)
    redirect_to ship_path(@ship)
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def destroy
    @ship.destroy
    redirect_to root_path
  end

  def my_ships
    @ships = current_user.ships
  end

  private

  def set_ship
    @ship = Ship.find(params[:id])
  end

  def ship_params
    params.require(:ship).permit(:name, :capacity, :description, :destination, :photo, :location, :price)
  end
end
