class Api::ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    return render json: {
      message: 'Record not found'
    }, layout: false, status: 404
  end
end
