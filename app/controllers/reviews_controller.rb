class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    # get the edit form
  end
  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to review_path(@review)
  end


  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if (@review.save)
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
