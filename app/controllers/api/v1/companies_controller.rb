class Api::V1::CompaniesController < Api::ApplicationController

  def index
    @response = companies_service.get_all
    @data = @response

    render 'api/v1/companies/index'
  end

  def show
    @response = companies_service.find(params[:id])
    return record_not_found if @response.nil?
    
    @data = @response
    @status = 200
    @message = 'Company found'
    
    render 'api/v1/companies/show'
  end

  private
    def companies_service
      CompaniesService.new(CompaniesRepository.new)
    end
end
