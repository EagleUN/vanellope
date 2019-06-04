# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /users/sign_in
  def showU
    user = User.find_by(email: params[:email])
    user2 = User.where(email: params[:email])
    if user!=nil
      if user.valid_password?(params[:password])
        sign_in(user)
      end
      if user_signed_in?
        user = user_session
        render json: {id: current_user.id, session: true}, status: 200
      else
        render json: {msg: "Email or password incorrect"}, status: 406
      end
    elsif user2!=nil
      if user_signed_in?
        user2 = user_session
        render json: user2, status: 200
      else
        render json: {msg: "Email or password incorrect"}, status: 406
      end
    else
      render json: {msg: "User no found"}, status: 404
    end
  end
  # def new
  #   notice
  # end


  # POST /resource/users/login
  def create
    user = User.find_by(email: params[:email])
    user2 = User.where(email: params[:email])
    if user!=nil
      if user.valid_password?(params[:password])
        sign_in(user)
      end
      if user_signed_in?
        user = user_session
        render json: {id: current_user.id, session: true}, status: 200
      else
        render json: {msg: "Email or password incorrect"}, status: 406
      end
    elsif user2!=nil
      if user_signed_in?
        user2 = user_session
        render json: user2, status: 200
      else
        render json: {msg: "Email or password incorrect"}, status: 406
      end
    else
      render json: {msg: "User no found"}, status: 404
    end
  end

  # DELETE /resource/users/logout
  def destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(current_user)
    if !user_signed_in?
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
