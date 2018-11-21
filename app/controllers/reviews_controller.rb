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

    if @review.save
      redirect_to restaurant_path(@review.restaurant_id)
    else
      # render :new
      redirect_to new_restaurant_review_path
    end
  end

    # respond_to do |format|
    #   if @restaurant.save
    #     format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
    #     format.json { render :show, status: :created, location: @restaurant }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @restaurant.errors, status: :unprocessable_entity }
    #   end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
