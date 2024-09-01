class AdministrationsController < ApplicationController
  before_action :set_administrations, only: %i[ show edit update destroy ]

  def index; 
    @administrators = User.all
  end

  def new
    @administrator = User.new
  end

  def create
    @administrator = User.new(user_params)
    if @administrator.save
      redirect_to administrations_path
    else
      render :new
    end
  end

  def show 
  end

  def update
  end

  def edit
  end

  def destroy
  
  end

  private 
    
    def set_administrations
      @administrator = User.find(params[:id])
    end

    def user_params
      params.permit(:email)
    end
end
