class TokenInviteService
  def self.generate_token
    SecureRandom.uuid
  end

  def valid_token_sent?(token)
    return false unless token.present?
    
    found_token = find_invitation_by_token_sent(token)

    return false unless found_token.present?

    found_token
  end

  def find_invitation_by_token_sent(token)
    invitation_service.find_invitation_by_token_sent(token)
  end

  def invitation_service
    @invitation_service ||= InviteService.new(InvitationRepository.new)
  end
end