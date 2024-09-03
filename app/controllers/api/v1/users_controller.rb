class Api::V1::UsersController < Api::ApplicationController

  def index
    @response = UsersService.new(UsersRepository.new).get_all
    @data = @response

    render 'api/v1/users/index'
  end

  def show
    @response = UsersService.new(UsersRepository.new).find(params[:id])
    return record_not_found if @response.nil?
    
    @data = @response
    @status = 200
    @message = 'User found'
    
    render 'api/v1/users/show'
  end
end
