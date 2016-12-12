require 'rails_helper'

RSpec.describe "Barters", type: :request do
  let(:survivor_a) { FactoryGirl.create(:survivor)}
  let(:survivor_b) { FactoryGirl.create(:survivor)}

  let(:attributes) {[ {:survivor_id => survivor_a.id, :items => [{:amount => 10, :kind => :ammo},
                                                                 {:amount => 5, :kind => :food}]},
                       :survivor_id => survivor_b.id, :items => [{:amount => 2, :kind => :water},
                                                                 {:amount => 6, :kind => :medicine}] ]}


  let(:params) {{format: :json, barter: attributes}}

  describe "POST /barters" do
    context "when the barter is possible" do

      it "should update survivor's items" do
        items_survivor_a = [FactoryGirl.create(:item, amount: 15, kind: :ammo, survivor_id: survivor_a.id),
                            FactoryGirl.create(:item, amount: 3, kind: :water, survivor_id: survivor_a.id),
                            FactoryGirl.create(:item, amount: 1, kind: :medicine, survivor_id: survivor_a.id),
                            FactoryGirl.create(:item, amount: 8, kind: :food, survivor_id: survivor_a.id)]

        items_survivor_b = [FactoryGirl.create(:item, amount: 6, kind: :water, survivor_id: survivor_b.id),
                            FactoryGirl.create(:item, amount: 1, kind: :food, survivor_id: survivor_b.id),
                            FactoryGirl.create(:item, amount: 2, kind: :ammo, survivor_id: survivor_b.id),
                            FactoryGirl.create(:item, amount: 9, kind: :medicine, survivor_id: survivor_b.id)]

        post "/barters", params
        expect(response).to have_http_status(201)
        body = JSON.parse(response.body)
        expect(items_survivor_a[0].amount) == 5
        expect(items_survivor_a[1].amount) == 5
        expect(items_survivor_a[2].amount) == 7
        expect(items_survivor_a[3].amount) == 3
        expect(items_survivor_b[0].amount) == 4
        expect(items_survivor_b[1].amount) == 6
        expect(items_survivor_b[2].amount) == 12
        expect(items_survivor_b[3].amount) == 3

      end
    end

  end

end
