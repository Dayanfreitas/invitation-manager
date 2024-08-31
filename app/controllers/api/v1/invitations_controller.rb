class Api::V1::InvitationsController < Api::ApplicationController 
  def create
    
    render json: { message: 'Criado com sucesso !' }, status: :ok
  end

  private 
    def invitation_params
      params.require(:invitation).permit(:company_id, :user_id, :status, :invited_at)
    end
end 
