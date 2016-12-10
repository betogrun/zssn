FactoryGirl.define do
  factory :location do
    lat Random.new.rand(-90.0..90.0).round(6).to_s
    lon Random.new.rand(-180.0..180.0).round(6).to_s
    survivor 0
  end
end
