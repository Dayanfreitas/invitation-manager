# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    # TODO: refactor this check to a service
    @token = params[:invitation_token]
    if @token.present? && Invitation.find_by(token: @token)&.user&.email.present?
      sign_in(Invitation.find_by(token: @token)&.user)
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
