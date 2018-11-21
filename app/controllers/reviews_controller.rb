# TODO: update create to add logic to check if data is valid. Use if statement
class ReviewsController < ApplicationController
  def index
    @review = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save

    redirect_to restaurants_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
