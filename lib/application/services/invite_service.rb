class InviteService < BaseService
  def initialize(repository)
    super(repository)
  end

  def create_invitation(email:, company_id:)
    user = users_service.find_or_create_user(email)
    
    return false unless user.present?

    attributes_invitation = {
      company_id: company_id,
      user_id: user.id,
      status: Invitation::Status::PENDING,
      invited_at: Time.now,
      token: TokenInviteService.generate_token
    }

    return create(attributes: attributes_invitation)    
  end

  def create(attributes: {})
    object = @repository.create(attributes: attributes)
    object.valid? ? object : false
  end

  def send_invitation
    raise NotImplementedError
  end

  def search_users_by_email(email)
    users_service.find_by_email(email)
  end

  private
    def users_service
      @users_service ||= UsersService.new(UsersRepository.new)
    end
end