require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before(:each) do
    request.headers['Authorization'] = JwtService.encode({user_id: 1})
    allow(Api::ApplicationController).to receive(:authenticate_request).and_return(true)
  end

  describe "GET /index" do
    it "returns a successful 200 response" do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it "returns a template" do
      get :index
      expect(response.body).to render_template("api/v1/users/index")
    end
  end
end
