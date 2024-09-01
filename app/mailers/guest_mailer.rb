class GuestMailer < ApplicationMailer
  
  def welcome_email
    @token = TokenInviteService.generate_token
    @link = get_link
    
    mail to: "to@example.org", subject: "Seja bem vindo"
  end

  def get_link
    "#{base_url}/users/sign_up?invitation_token=#{@token}"
  end
end
