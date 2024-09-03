class GuestMailer < ApplicationMailer
  
  def welcome_email(invitation:)
    @token = invitation.token
    @link = link_confirmation_invite(token: @token)
    
    mail to: "to@example.org", subject: "Seja bem vindo"
  end

  def link_confirmation_invite(token:)
    "#{base_url}/users/login?invitation_token=#{token}"
  end
end