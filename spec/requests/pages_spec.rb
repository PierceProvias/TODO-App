require 'rails_helper'

RSpec.describe PagesController, type: :request do
  context "GET root path" do
    it "returns http success" do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  context 'GET #about' do
    it 'returns http success' do
      get '/about'
      expect(response).to have_http_status(:success)
    end
  end

end
