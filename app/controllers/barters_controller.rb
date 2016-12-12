class BartersController < ApplicationController
  #before_action :set_barter, only: [:show, :update, :destroy]
  before_action :set_survivors
  before_action  :set_items


  # POST /barters
  def create

    Barter.perform(@survivors[0], @survivors[1], @items_to_barter_a, @items_to_barter_b)
    if @survivors.each { |survivor| survivor.save }
      render json: @survivors, status: :created
    else
      render json: @survivors.errors, status: :unprocessable_entity
    end
  end


  private

  def set_items
    items_params = []
    params['barter'].each do |barter|
      barter['items'].each do |items|
        items_params << Item.new(amount: items['amount'], kind: items['kind'], survivor_id: barter['survivor_id'] )
      end
    end
    @items_to_barter_a = items_params.select { |key, value| key.survivor_id == @survivors[0].id }
    @items_to_barter_b = items_params.select { |key, value| key.survivor_id == @survivors[1].id }
  end


    def set_survivors
      @survivors = params['barter'].map { |survivor| Survivor.find(survivor['survivor_id']) }
    end

end
