class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ show edit update destroy ]

  def index
    @invitations = invite_service.all_invitations(filter: {
      start_date: params[:start_date],
      end_date: params[:end_date],
      status: params[:status],
      user: params[:user],
      company: params[:company]
    })
  end

  def show; end

  def new
    @invitation = invite_service.new_instance(current_user: current_user)
  end

  def edit; end

  def create
    @invitation = invite_service.create_invitation(
      email: invitation_params[:email],
      company_id: invitation_params[:company_id]
    )

    if @invitation.present? && @invitation.valid?
      invite_service.send_invitation(invitation: @invitation)
      redirect_to @invitation, notice: I18n.t('controller.invitations.create.success'), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if invite_service.update(id: @invitation.id, attributes: invitation_params)
      redirect_to @invitation, notice: I18n.t('controller.invitations.update.success'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    invite_service.destroy(@invitation.id)
    redirect_to invitations_url, notice: I18n.t('controller.invitations.destroy.success'), status: :see_other
  end

  private
    def set_invitation
      @invitation = invite_service.find(params[:id])
    end

    def invitation_params
      params.require(:invitation).permit(:email, :company_id, :user_id, :status, :invited_at)
    end

    def invite_service
      InviteService.new(
        InvitationRepository.new,
      )
    end
end
