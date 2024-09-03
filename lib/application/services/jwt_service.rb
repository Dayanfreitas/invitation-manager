class JwtService
  # SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  SECRET_KEY = "secret"

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)
    HashWithIndifferentAccess.new(decoded.first)
  rescue
    nil
  end
end
