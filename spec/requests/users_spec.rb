require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:user) {User.create!(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', password_digest: 'password', avatar: nil)}
  
  context "GET user profile" do
    it "returns http failure" do
      get "/users/profile"
      expect(response).to have_http_status(:not_found)
    end

    
    
  end

end
