class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
    render json: @reviews
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    render json: @review
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    render json: @review
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :content, :user_id, :business_id)
    end
end
