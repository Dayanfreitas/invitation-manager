class InviteService
  def create_invitation(email:, company_id:)
    user = search_users_by_email(email)
    
    if user.present?
      return Invitation.new
    end

    
    return Invitation.new
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