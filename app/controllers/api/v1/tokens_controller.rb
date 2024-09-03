class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    # if @user&.authenticate(user_params[:password])
    if @user.present?
      render json: {
        token: JsonWebToken.encode(user_id: @user.id),
        email: @user.email
      }, status: :ok
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end