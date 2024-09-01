class Api::V1::UsersController < Api::ApplicationController 
  def index
    render json: { message: 'Hello, World!' }
  end
end
