require 'rails_helper'

RSpec.describe "Denouncements", type: :request do
  let(:survivor) { FactoryGirl.create(:survivor)}
  let(:denounced) {FactoryGirl.create(:survivor)}
  let(:attributes) {{:survivor_id => survivor.id, :denounced_id => denounced.id}}
  let(:params) {{format: :json, denouncement: attributes}}

  describe "GET /denouncements" do
    it "show the items that belongs to a survivor" do
      get "/survivors/#{survivor.id}/denouncements"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /survivor/survivor:id/denouncements" do
    context "when the survivor is not a zombie" do
      it "should be able to create a denouncement" do
        post "/survivors/#{survivor.id}/denouncements", params
        expect(response).to have_http_status(201)
        body = JSON.parse(response.body)

        expect(body['survivor_id']).to eq survivor.id
        expect(body['denounced_id']).to eq denounced.id
      end

      it "denounced complaints counter should be incremeted by 1" do
        previous_complaints_value = denounced.complaints
        post "/survivors/#{survivor.id}/denouncements", params
        body = JSON.parse(response.body)

        expect(body['denounced']['complaints']).to eq previous_complaints_value+1
      end

      it "should not be able to denounce the same survivor twice" do
        previous_complaints_value = denounced.complaints
        post "/survivors/#{survivor.id}/denouncements", params
        post "/survivors/#{survivor.id}/denouncements", params
        body = JSON.parse(response.body)

        expect(body['denounced']['complaints']).to eq previous_complaints_value+1
      end
    end

    context "when denounced survivor complaints counter hits the limit (3)" do
      let(:denounced) {FactoryGirl.create(:survivor, complaints: 2)}
      it "should mark the denounced survivor as infected" do
        post "/survivors/#{survivor.id}/denouncements", params
        body = JSON.parse(response.body)

        expect(body['denounced']['complaints']).to eq 3
        expect(body['denounced']['is_infected']).to eq true

      end
    end
  end

end
