class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_destroyed(error)
    render json: { errors: error.record.errors }, status: :unprocessable_entity
  end

  def not_found
    render json: { message: 'Record Not Found' }, status: :not_found
  end
end
