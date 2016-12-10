class DenouncementsController < ApplicationController
  before_action :set_denouncement, only: [:show, :update, :destroy]

  # GET /denouncements
  def index
    @denouncements = Denouncement.all

    render json: @denouncements
  end

  # GET /denouncements/1
  def show
    render json: @denouncement
  end

  # POST /denouncements
  def create
    @denouncement = Denouncement.new(denouncement_params)

    if @denouncement.save
      render json: @denouncement, status: :created, location: @denouncement
    else
      render json: @denouncement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /denouncements/1
  def update
    if @denouncement.update(denouncement_params)
      render json: @denouncement
    else
      render json: @denouncement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /denouncements/1
  def destroy
    @denouncement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_denouncement
      @denouncement = Denouncement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def denouncement_params
      params.require(:denouncement).permit(:survivor_id, :denounced_id)
    end
end
