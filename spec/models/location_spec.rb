require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should allow_value("-22.005773").for(:lat) }
  it { should_not allow_value("foo").for(:lat) }
  it { should allow_value("-47.904264").for(:lon) }
  it { should_not allow_value("foo").for(:lon) }
end
