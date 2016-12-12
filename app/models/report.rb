class Report < ApplicationRecord
  attr_accessor :total
  def self.run
    @total = Survivor.count
   "Infected users:#{infected_users},
                  Not Infected users: #{not_infected_users},
                  Average amount of water: #{average_amount(:water)},
                  Average amount of food: #{average_amount(:food)},
                  Average amount of medicine: #{average_amount(:medicine)},
                  Average amount of ammo: #{average_amount(:ammo)},
                  Lost score per zombie: #{lost_score}"
  end

  private

  def self.infected_users
    Survivor.where(is_infected: true).count.to_f / @total * 100
  end

  def self.not_infected_users
    100 - infected_users
  end

  def self.average_amount(kind)
    Item.where(kind: kind).reduce(0) { |sum, i| i.amount } / @total
  end

  def self.lost_score
    infected_items = []
    Survivor.where(is_infected: true).each do |survivor|
      infected_items = Item.where(survivor_id: survivor.id)
    end
    Barter.balance(infected_items)
  end

end
