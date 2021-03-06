class DenouncementsController < ApplicationController
  before_action :set_denouncement, only: [:show, :update, :destroy]

  # GET /denouncements
  def index
    @denouncements = Denouncement.all

    render json: @denouncements, :include =>  :denounced
  end

  # GET /denouncements/1
  def show
    render json: @denouncement, :include => :denounced
  end

  # POST /denouncements
  def create
    @denouncement = Denouncement.new(denouncement_params)

    if @denouncement.save
      render json: @denouncement, status: :created, :include => :denounced
    else
      render json: @denouncement.errors, status: :unprocessable_entity
    end
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
