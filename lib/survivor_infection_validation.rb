module SurvivorInfectionValidation

  def self.included(base)
    self.before_action :check_survivor_infection params[:survivor_id]
  end

  def check_survivor_infection(survivor_id)

  end
end
