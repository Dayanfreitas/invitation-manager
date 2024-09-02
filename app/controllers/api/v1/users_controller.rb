class Api::V1::UsersController < Api::ApplicationController

  def index
    @response = UsersService.new(UsersRepository.new).get_all
    @data = @response

    render 'api/v1/users/index'
  end

  def show
    @response  = UsersService.new(UsersRepository.new).find(params[:id])
    byebug
    @data = @response
    
    render 'api/v1/users/show'
  end
end
