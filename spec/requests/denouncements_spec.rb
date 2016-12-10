require 'rails_helper'

RSpec.describe "Denouncements", type: :request do
  describe "GET /denouncements" do
    it "works! (now write some real specs)" do
      get denouncements_path
      expect(response).to have_http_status(200)
    end
  end
end
