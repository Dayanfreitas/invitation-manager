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

    it "should not return all companies" do
      get :index

      expect(assigns(:companies)).to be_empty
    end
  end

  context "#GET #show" do
    it "should success render to show" do
      company = FactoryBot.create(:company)
      get :show, params: { id: company.id }

      expect(response).to have_http_status(:success)
    end

    it "should return company" do
      company = FactoryBot.create(:company)
      get :show, params: { id: company.id }

      expect(assigns(:company)).to eq(company)
    end

    it "should not return company" do
      get :show, params: { id: 0 }

      expect(assigns(:company)).to be_nil
    end
  end
end
