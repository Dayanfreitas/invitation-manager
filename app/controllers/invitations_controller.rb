class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[ show edit update destroy ]

  def index
    @invitations = invite_service.all_invitations
  end

  def show
  end

  def new
    @invitation = invite_service.new_instance
  end

  def edit; end

  def create
    @invitation = invite_service.create_invitation(
      email: invitation_params[:email],
      company_id: invitation_params[:company_id]
    )

    if @invitation.present?
      redirect_to @invitation, notice: "Invitation was successfully created."
    else
      @invitation = invite_service.new_instance
      @errors = ["Email already invited"]
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if invite_service.update(id: @invitation.id, attributes: invitation_params)
      redirect_to @invitation, notice: "Invitation was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    invite_service.destroy(@invitation.id)
    redirect_to invitations_url, notice: "Invitation was successfully destroyed.", status: :see_other
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
