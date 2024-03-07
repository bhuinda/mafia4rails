class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { token: token }, status: :ok     
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def validate
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      decoded = JWT.decode(header, Rails.application.secret_key_base).first
      render json: { valid: true }, status: :ok
    rescue JWT::DecodeError, JWT::ExpiredSignature
      render json: { valid: false }, status: :ok
    end
  end

  private

  def jwt_encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secret_key_base)
  end
end
