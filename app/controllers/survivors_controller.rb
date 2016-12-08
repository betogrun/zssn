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
    if is_indicment_operation?
      create_indicment
    else
      @survivor = Survivor.new(survivor_params)
      if @survivor.save
        render json: @survivor, status: :created, location: @survivor
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /survivors/1
  def update
    if @survivor.update(survivor_params)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /survivors/1
  def destroy
    @survivor.destroy
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

    def indicment_params
      params.permit(:operation, :accuser_id, :indicted_id)
    end

    def is_indicment_operation?
      params[:operation].present? && params[:operation] == "indict"
    end

    def create_indicment
      @accuser = Survivor.find(indicment_params[:accuser_id])
      @indicted = Survivor.find(indicment_params[:indicted_id])
      @accuser.create_indicment(@indicted)
      @accuser.indicteds << @indicted
    end
end
