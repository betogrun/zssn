require 'rails_helper'

RSpec.describe "Denouncements", type: :request do
  let(:survivor) { FactoryGirl.create(:survivor)}
  
  describe "GET /denouncements" do
    it "show the items that belongs to a survivor" do
      get "/survivors/#{survivor.id}/denouncements"
      expect(response).to have_http_status(200)
    end
  end
end
