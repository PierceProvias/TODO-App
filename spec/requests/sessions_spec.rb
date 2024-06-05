# spec/controllers/sessions_controller_spec.rb
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  fixtures :users
  #let(:valid_user) { users(:valid_user) }

  current_user = User.first_or_create(first_name: 'Valid', last_name: 'User', email: 'user@gmail.com', password_digest: 'password')
  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs in the user and redirects to root path' do
        post :create, params: { email: current_user.email, password: 'password' }
        expect(session[:user_id]).to eq(current_user.id)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Logged in successfully')
      end
    end

    context 'with invalid credentials' do
      it 'renders the new template with unprocessable entity status' do
        post :create, params: { email: user.email, password: 'wrong_password' }
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
        expect(flash[:alert]).to eq('Invalid email or password')
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      session[:user_id] = user.id
    end

    it 'logs out the user and redirects to root path' do
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
      expect(flash[:notice]).to eq('Logged out')
    end
  end
end
