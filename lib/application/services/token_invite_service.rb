class TokenInviteService
  def self.generate_token
    SecureRandom.uuid
  end
end