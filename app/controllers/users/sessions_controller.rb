# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    @token = params[:invitation_token]
    if @token.present?
      @token_valid = TokenInviteService.new.valid_token_sent?(@token)

      return redirect_to not_found_path unless @token_valid.present?
      
      sign_in(@token_valid.user)
      return redirect_to root_path
    end
   
    super
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
