class Barter < ApplicationRecord
  enum score: [water:  4, food: 3, medicine: 2, ammo: 1]

  def self.perform( survivor_a, survivor_b, items_to_barter_a, items_to_barter_b )
    if balance(items_to_barter_a) - balance(items_to_barter_b) == 0
      update_items(survivor_a.items, items_to_barter_b)
      update_items(survivor_b.items, items_to_barter_a)
      update_items()
    end
  end

  private

  def self.balance(items_to_barter)
    if items_to_barter.any?
      items_to_barter.reduce(0){|sum, i| sum + (i.amount*
        Barter.scores.keys.first[i.kind.to_sym] )}
    end
  end

  def self.update_items(survivor_items, bartered_items)
    bartered_items.each do |bartered_item|
      survivor_items.each do |survivor_item|
        if survivor_item.kind == bartered_item.kind
          if survivor_item.survivor_id == bartered_item.survivor_id
            survivor_item.amount -= bartered_item.amount
          else
            survivor_item.amount += bartered_item.amount
          end
        end
      end
    end
  end

end
