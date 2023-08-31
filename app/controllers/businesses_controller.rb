class BusinessesController < ApplicationController
  before_action :set_business, only: %i[ show edit update destroy ]

  def index
    @businesses = Business.all
    render json: @businesses
  end

  def show
    render json: @business
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: { errors: @business.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @business.update(business_params)
      render json: @business, status: :ok, location: @business
    else
      render json: { errors: @business.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @business.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def business_params
      params.require(:business).permit(:name, :description, :address, :phone, :website)
    end
end
