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

    create(attributes: attributes_invitation)
  end

  def create(attributes: {})
    @repository.create(attributes: attributes)
  end

  def update(id: nil, attributes: {})
    @repository.update(id: id, attributes: attributes)
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

  def new_instance(current_user:)
    instance = @repository.new_instance
    instance.company_id = current_user.company.id
    instance.status = Invitation::Status::PENDING
    instance.invited_at = Time.now
    instance
  end

  def find(id)
    @repository.get_all(filter: { id: id }).first
  end

  def all_invitations
    @repository.get_all(filter: {})
  end

  def destroy(id)
    @repository.destroy(id)
  end

  private
    def users_service
      @users_service ||= UsersService.new(UsersRepository.new)
    end
end