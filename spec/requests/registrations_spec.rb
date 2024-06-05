require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  context "GET /new" do
    it "returns http success" do
      get "/registrations/new"
      expect(response).to have_http_status(:success)
    end
  end

  context "User is successfully created" do
    it "returns http success and redirected to root path" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

end
