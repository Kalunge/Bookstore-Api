class Api::V1::AuthenticationController < ApplicationController
  class AuthenticationError < StandardError; end
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from AuthenticationError, with: :handle_unathenticated
  
  def create
    raise AuthenticationError unless user.authenticate(params.require(:password))
    token = AuthenticationTokenService.encode(user.id)

    render json: { token: token }, status: :created
  end

  private

  def user
    @user ||= User.find_by(username: params.require(:username))
  end

  def parameter_missing
    render json: { errors: 'Username or Password is missing' }, status: :unprocessable_entity
  end

  def handle_unathenticated
    head :unauthorized
  end
end
