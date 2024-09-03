class Api::V1::InvitationsController < Api::ApplicationController 
  def index
    invitequerybuilder = InviteQueryBuilder.new

    @response = invite_service.all_invitations(filter: {
      start_date: params[:start_date],
      end_date: params[:end_date],
      status: params[:status],
      user: params[:user],
      company: params[:company]
    })
        
    @data = @response
    @status = 200

    render 'api/v1/invites/index', status: @status
  end

  def create
    invite = invite_service.create_invitation(
      email: invitation_params[:email],
      company_id: invitation_params[:company_id]
    )
   
    @data = invite
    @status = 200
    @message = ''
  
    if invite.valid?
      @message = 'Invitation created'
    else
      @status = 500
      @message = invite.errors.full_messages.join(', ')
    end

    render 'api/v1/invites/show', status: @status
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
