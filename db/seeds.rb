survivors_list = [
  ["Jonh", 45, :male, false, 0],
  ["Paul", 43, :male, false, 2],
  ["George", 53, :male, false, 0],
  ["Peter", 11, :male, false, 2],
  ["Harry", 53, :male, true, 0],
  ["Antony", 25, :male, false, 0],
  ["Steve", 44, :male, true, 2],
  ["Ringo", 23, :male, false, 0],
  ["Julia", 31, :female, false, 1],
  ["Robert", 89, :male, true, 3],
  ["Helen", 22, :female, false, 0]
]
survivors = []
survivors_list.each do |name, age, gender, is_infected, complaints|
  survivors << Survivor.create(name: name, age: age, gender: gender, is_infected: is_infected, complaints: complaints)
end

survivors.each do |survivor|
  Location.create(lat: rand(-90.0..90.0).round(6).to_s , lon: rand(-180.0..180.0).round(6).to_s , survivor: survivor)
  Item.create(amount: rand(1..100), kind: :water, survivor: survivor)
  Item.create(amount: rand(1..100), kind: :food, survivor: survivor)
  Item.create(amount: rand(1..100), kind: :medicine, survivor: survivor)
  Item.create(amount: rand(1..100), kind: :ammo, survivor: survivor)
end
