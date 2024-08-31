class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    return render 'errors/404', layout: false, status: 404
  end
end
