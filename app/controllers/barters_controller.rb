class BartersController < ApplicationController
  before_action :set_barter, only: [:show, :update, :destroy]

  # GET /barters
  def index
    @barters = Barter.all

    render json: @barters
  end

  # GET /barters/1
  def show
    render json: @barter
  end

  # POST /barters
  def create
    @barter = Barter.new(barter_params)

    if @barter.save
      render json: @barter, status: :created, location: @barter
    else
      render json: @barter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /barters/1
  def update
    if @barter.update(barter_params)
      render json: @barter
    else
      render json: @barter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /barters/1
  def destroy
    @barter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barter
      @barter = Barter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def barter_params
      params.require(:barter).permit(:score)
    end
end
