class Api::V1::TokensController < ActionController::API
  def create
    @user = User.find_by_email(user_params[:email]) 
    
    if @user.present? && @user&.valid_password?(user_params[:password])
      @token = JwtService.encode(user_id: @user.id)
      @status = 200
      render 'api/v1/tokens/index', status: @status
    else
      head :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end