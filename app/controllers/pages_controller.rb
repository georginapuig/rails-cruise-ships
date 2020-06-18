class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:location].present?
      @ships = Ship.search_by_location_and_destination(params[:location])
    else
      @ships = Ship.limit(6)
    end
  end
end
