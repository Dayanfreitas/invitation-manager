class Api::V1::InvitationsController < Api::ApplicationController 
  def create
    invite = invite_service.create_invitation(
      email: invitation_params[:email],
      company_id: invitation_params[:company_id]
    )

    render json: { message: 'Criado com sucesso !', data: {
      invitation: invite
    } }, status: :ok
  end

  private 
    def invitation_params
      params.require(:invitation).permit(:email,:company_id, :user_id, :status, :invited_at)
    end

    def users_service
      @users_service ||= UsersService.new(UsersRepository.new)
    end

    def invite_service
      InviteService.new(
        InvitationRepository.new,
      )
    end
end 
