module ZombieAccessBlocker
  extend ActiveSupport::Concern

  included do
    before_action :avoid_zombie_access
  end

  def avoid_zombie_access
    survivor = Survivor.find(params[:survivor_id])
    if survivor.is_infected
      render json: { message: "#{survivor.name} is a zombie, it is not allowed to use the inventory" }, status: :unprocessable_entity
    end
  end
end
