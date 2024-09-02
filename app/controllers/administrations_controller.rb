class AdministrationsController < ApplicationController
  before_action :set_administrations, only: %i[ show edit update destroy ]

  def index
    @administrators = users_service.get_all(filter: {})
  end

  def new
    @administrator = users_service.new_instance
  end

  def create
    attributes ={
      email: params[:email],
      password: params[:password]
    }

    @administrator = users_service.create_admin(attributes: attributes)  
    if @administrator.persisted?
      redirect_to administrations_path, notice: I18n.t('controller.users.create.success'), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def update
    attributes = {
      email: user_params[:email]
    }
    @administrator_updated = users_service.update(id: @administrator.id, attributes: attributes)
    
    if @administrator_updated
      redirect_to edit_administration_path(id: @administrator.id), notice: I18n.t('controller.users.update.success'), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    users_service.destroy(@administrator.id)
    redirect_to administrations_path, notice: I18n.t('controller.users.destroy.success')
  end

  private 
    
    def set_administrations
      @administrator = User.find(params[:id])
    end

    def user_params
      params.permit(:email)
    end

    def users_service
      @users_service ||= UsersService.new(UsersRepository.new)
    end
end
