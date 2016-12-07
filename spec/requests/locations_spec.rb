require 'rails_helper'

RSpec.describe "Locations", type: :request do
  let(:survivor) { FactoryGirl.create(:survivor)}

  describe "GET /survivor/:id/location" do
    it "show the last location of a given survivor" do
      get "/survivors/#{survivor.id}/locations"
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /survivor/:id/location" do
    let(:old_location) { FactoryGirl.create(:location, survivor_id: survivor.id)}
    let(:attributes) {{:lat => "-22.017245", :lon => "-47.915900", :survivor_id => survivor.id}}
    let(:params) {{format: :json, location: attributes}}

    it "update the location of a given survivor" do
      put "/survivors/#{survivor.id}/locations/#{old_location.id}", params

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      expect(body['lat']).to eq "-22.017245"
      expect(body['lon']).to eq "-47.915900"
    end
  end
end
