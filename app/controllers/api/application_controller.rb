class Api::ApplicationController < ActionController::API
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    return render json: {
      message: 'Record not found'
    }, layout: false, status: 404
  end
end
