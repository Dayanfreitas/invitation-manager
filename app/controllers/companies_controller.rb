class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show update edit destroy ]

  def index
    @companies = Company.all
  end

  def show; end

  def edit
    @company = companies_service.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = companies_service.create(attributes: company_params)
    if @company.persisted?
      redirect_to @company, notice: "Company was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    attributes = { name: company_params[:name] }
    if companies_service.update(id: @company.id, attributes: attributes) 
      redirect_to @company, notice: "Company was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    companies_service.destroy(@company.id)
    redirect_to companies_url, notice: "Company was successfully destroyed.", status: :see_other
  end

  private

    def set_company
      @company = companies_service.find(params[:id])      
    end

    def company_params
      params.require(:company).permit(:name)
    end

    def companies_service
      CompaniesService.new(CompaniesRepository.new)
    end
end
