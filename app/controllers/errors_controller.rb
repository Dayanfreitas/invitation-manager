class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[not_found]
  
  def not_found
    record_not_found
  end
end
