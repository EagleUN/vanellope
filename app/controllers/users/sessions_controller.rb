# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /users/sign_in
  # def new
  #   notice
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:email])
    if user!=nil
      if user_signed_in?
        user = user_session
        render json: user, status: 200
      else
        render json: {msg: "email or password incorrect"}, status: 406
      end
    else
      render json: {msg: "User no found"}, status: 404
    end
  end

  # DELETE /resource/sign_out
  def destroy
    if current_user==nil
      render json: {msg: "exit successful"}, status: 200
    else
      render json: {}, status: 400
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :last_name])
  end
end
