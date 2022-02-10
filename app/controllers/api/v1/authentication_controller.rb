class Api::V1::AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  def create
    user = User.find_by(username: params.require(:username))
    token = AuthenticationTokenService.encode(user.id)

    p params.require(:password).inspect
    render json: { token: token }, status: :created
  end

  private

  def parameter_missing
    render json: { errors: 'Username or Password is missing' }, status: :unprocessable_entity
  end
end
