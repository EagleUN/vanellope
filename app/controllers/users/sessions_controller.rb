# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /users/sign_in
  # def new
  #   notice
  # end

  # POST /resource/users/login
  def create
    user = User.where(email: params[:email])
    
    if user!=nil
      if user_signed_in?
        user = user_session
        render json: user, status: 200
      else
        render json: {msg: "Email or password incorrect"}, status: 406
      end
    else
      render json: {msg: "User no found"}, status: 404
    end
  end

  # DELETE /resource/users/logout
  def destroy
    if current_user==nil
      render json: {msg: "Exit successful"}, status: 200
    else
      render json: {msg: "Bad process"}, status: 400
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :last_name])
  end

  def user_params
    params.permit(:email, :password)
  end

end
