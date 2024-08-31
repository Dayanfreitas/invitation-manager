require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  context "#GET index" do
    it "should success render to index" do
      get :index
      
      expect(response).to have_http_status(:success)
    end

    it "should sucess render to index" do 
      get :index

      expect(response).to have_http_status(:success)
    end

    it "should return all companies" do
      company = FactoryBot.create(:company)
      get :index

      expect(assigns(:companies)).to eq([company])
    end
  end
end
