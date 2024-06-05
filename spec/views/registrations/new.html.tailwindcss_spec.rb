require 'rails_helper'

RSpec.describe "SignUps", type: :request do
  describe "GET /sign_up" do
    it "renders the sign up form" do
      get sign_up_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Sign Up")
    end
  end

  describe "POST /sign_up" do
    context "with valid parameters" do
      let(:valid_attributes) {
        {
          user: {
            first_name: "John",
            last_name: "Doe",
            email: "john.doe@example.com",
            password: "password",
            password_confirmation: "password"
          }
        }
      }

      it "creates a new user" do
        expect {
          post sign_up_path, params: valid_attributes
        }.to change(User, :count).by(1)
      end

      #it "redirects to the user's show page" do
      #  post sign_up_path, params: valid_attributes
      #  expect(response).to redirect_to(User.last)
      #end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) {
        {
          user: {
            first_name: "",
            last_name: "",
            email: "invalid_email",
            password: "password",
            password_confirmation: "mismatch"
          }
        }
      }

      it "does not create a new user" do
        expect {
          post sign_up_path, params: invalid_attributes
        }.to change(User, :count).by(0)
      end

      it "renders the sign up form with errors" do
        post sign_up_path, params: invalid_attributes
        expect(response).to have_http_status(200)
        expect(response.body).to include("error")
      end
    end
  end
end
