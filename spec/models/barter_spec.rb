require 'rails_helper'

RSpec.describe Barter, type: :model do
  context "when a trade is performed" do
    let(:survivor_a) {FactoryGirl.create(:survivor, id: 1)}
    let(:survivor_b) {FactoryGirl.create(:survivor, id: 2)}
    let(:items) {[FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: survivor_a.id)]}
    let(:items_to_receive) {[FactoryGirl.create(:item, amount: 5, kind: :ammo, survivor_id: survivor_b.id)]}
    it "survivor's items are updated" do
      Barter.update_items(items, items_to_receive)
      expect(items.first.amount) == 15
    end

    let(:items) {[FactoryGirl.create(:item, amount: 10, kind: :ammo, survivor_id: survivor_a.id),
                 FactoryGirl.create(:item, amount: 2, kind: :water, survivor_id: survivor_a.id),
                 FactoryGirl.create(:item, amount: 5, kind: :medicine, survivor_id: survivor_a.id),
                 FactoryGirl.create(:item, amount: 1, kind: :food, survivor_id: survivor_a.id)]}
    it "balance return the sum of the amount times score" do
      balance = Barter.balance(items)
      expect(balance) == 31
    end

  end
end
