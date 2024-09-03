require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before {
    sign_in(create(:user))
  }
  describe "GET /index" do
    xit "returns a successful 200 response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    xit "returns a 'Hello, World!' message" do
      get :index
      expect(response.body).to eq({ message: 'Hello, World!' }.to_json)
    end
  end
end
