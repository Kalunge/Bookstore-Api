class Api::V1::AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  def create
    p params.require(:username).inspect
    p params.require(:password).inspect
    render json: { token: '123' }, status: :created
  end

  private

  def parameter_missing
    render json: { errors: 'param is missing or the value is ' }, status: :unprocessable_entity
  end
end
