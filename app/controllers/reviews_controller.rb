class ReviewsController < ApplicationController
  def create
    @ship = Ship.find(params[:ship_id])
    @review = Review.new(review_params)
    @review.ship = @ship
    if @review.save
      redirect_to ship_path(@ship, anchor: "review-#{@review.id}")
    else
      @booking = Booking.new
      render 'ships/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
