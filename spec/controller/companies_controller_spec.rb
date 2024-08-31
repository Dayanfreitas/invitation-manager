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

    it "should return 404" do
      get :show, params: { id: 0 }

      expect(response).to have_http_status(404)
    end
  end

  context "POST #create" do 
    it "should success create company" do
      post :create, params: { company: { name: "Company 1" } }

      expect(response).to have_http_status(:created)
    end

    it "should return company" do
      post :create, params: { company: { name: "Company 1" } }

      expect(assigns(:company)).to be_a(Company)
      expect(assigns(:company)).to be_persisted
    end

    it "should not create company" do
      post :create, params: { company: { name: "" } }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "PUT #update" do
    it "should success update company" do
      company = FactoryBot.create(:company)
      put :update, params: { id: company.id, company: { name: "Company 2" } }

      expect(response).to have_http_status(:success)
    end

    it "should return name updated" do
      company = FactoryBot.create(:company)
      put :update, params: { id: company.id, company: { name: "Company 2" } }

      expect(assigns(:company).name).to eq("Company 2")
    end
    
    it "should return company" do
      company = FactoryBot.create(:company)
      put :update, params: { id: company.id, company: { name: "Company 2" } }

      expect(assigns(:company)).to eq(company)
    end

    it "should not update company" do
      company = FactoryBot.create(:company)
      put :update, params: { id: company.id, company: { name: "" } }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "DELETE #destroy" do
    it "should success delete company" do
      company = FactoryBot.create(:company)
      delete :destroy, params: { id: company.id }

      expect(response).to have_http_status(:success)
    end

    it "should return company deleted" do
      company = FactoryBot.create(:company)
      delete :destroy, params: { id: company.id }

      expect(assigns(:company)).to eq(company)
    end

    it "should not delete company" do
      delete :destroy, params: { id: 0 }

      expect(response).to have_http_status(404)
    end
  end
end
