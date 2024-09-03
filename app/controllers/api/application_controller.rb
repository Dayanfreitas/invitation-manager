class Api::ApplicationController < ActionController::API
  class TokenNotProvided < StandardError; end
  class TokenInvalid < StandardError; end
  class NotAuthorized < StandardError; end

  respond_to :json

  before_action :authenticate_request

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from TokenNotProvided, with: :token_not_provide
  rescue_from TokenInvalid, with: :token_invalid
  rescue_from NotAuthorized, with: :not_authorized

  
  def record_not_found
    return render json: {
      message: 'Record not found'
    }, layout: false, status: 404
  end

  def token_not_provide
    render json: { message: 'Token not provide'}, status: :unauthorized
  end

  def token_invalid
    render json: { message: 'Token invalid'}, status: :unauthorized
  end

  def not_authorized
    render json: { message: 'Not Authorized' }, status: :unauthorized
  end

  private

    def authenticate_request
      authorization = request.headers['Authorization']
      
      raise TokenNotProvided if authorization.nil?
      
      token = authorization&.split(' ')&.last
      decoded_token = JwtService.decode(token)
      
      raise TokenInvalid if decoded_token.nil?

      @current_user = users_service.find(decoded_token[:user_id] )
      
      raise NotAuthorized unless @current_user
    end

    def users_service
      @users_service ||= UsersService.new(UsersRepository.new)
    end
end
