require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /reports" do
    it "show the reports" do
      get reports_path
      expect(response).to have_http_status(200)
    end
  end
end
