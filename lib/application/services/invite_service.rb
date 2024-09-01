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

    invitation = create(attributes: attributes_invitation)
    send_invitation(invitation: invitation) if invitation.present?
    
    return invitation
  end

  def create(attributes: {})
    object = @repository.create(attributes: attributes)
    object.valid? ? object : false
  end

  def send_invitation(invitation:)
    GuestMailer.welcome_email(invitation: invitation).deliver_now
    invitation.sent!
  end

  def search_users_by_email(email)
    users_service.find_by_email(email)
  end
  
  def find_invitation_by_token_sent(token)
    qb = InviteQueryBuilder.new
    qb.with_status(Invitation::Status::SENT)
    qb.with_token(token)

    filter = qb.build

    @repository.get_all(filter: filter).first
  end

  private
    def users_service
      @users_service ||= UsersService.new(UsersRepository.new)
    end
end