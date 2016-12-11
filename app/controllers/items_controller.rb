class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]
  #before_action :avoid_zombie_access, only: [:update, :destroy]
  before_action :avoid_item_duplication, only: :create

  include ZombieAccessBlocker

  # GET /items
  def index
    @items = Item.all

    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:amount, :kind, :survivor_id)
    end



    def avoid_item_duplication
      if Item.where(kind: item_params['kind'], survivor_id: item_params['survivor_id']).first_or_initialize.id?
        render json: { message: "item whose kind is #{item_params['kind']} already exists" }, status: :unprocessable_entity
      end
    end
end
