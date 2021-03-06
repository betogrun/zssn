class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :destroy]

  # GET /survivors
  def index
    @survivors = Survivor.all

    render json: @survivors, :include => {:location => {:only => [:lat, :lon]},
                                        :items => {:only => [:amount, :kind]}}, :except => [:created_at, :updated_at]
  end

  # GET /survivors/1
  def show
    render json: @survivor, :include => {:location => {:only => [:lat, :lon]},
                                        :items => {:only => [:amount, :kind]}}, :except => [:created_at, :updated_at]
  end

  # POST /survivors
  def create
    @survivor = Survivor.new(survivor_params)
    if @survivor.save
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survivor
      @survivor = Survivor.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def survivor_params
      params.require(:survivor).permit(:name, :age, :gender, :is_infected, :complaints)
    end

end
