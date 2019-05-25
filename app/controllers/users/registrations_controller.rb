# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource/user/create
  def create
    user = User.new(user_params)
    if user.save
        render json: {}, status: 201
    else
        render json: user.errors, status: 400
    end
  end

  # GET /resource/edit
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: {msg: 'User details have been updated.' },  status: 200
    else
      render json: {msg: 'The user does not exist.' }, status: 406
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # GET /resource/user
  def show
    user = User.find_by(email: params[:email])
    if user!=nil
      render json: { user: {id: user.id, name: user.name, last_name: user.last_name, email: user.email} }, status: 200
    else
      render json: {msg: 'The user does not exist.' }, status: 406
    end
  end  

  # GET /resource/users
  def showAll
    user = User.all
    render json: { total: user.size(), list: user.select(:name, :last_name, :email).as_json(:except => :id) }, status: 202
  end 
  
  # DELETE /resource/user
  def destroyUser
    #currUser = current_user
    #if currUser!=nil
    user = User.find_by(id: params[:id])
    
    # if user.id==currUser.id
    if user.destroy(user.id)
      render json: {msg: 'The user was successfully deleted.' },  status: 202
    else
      render json: {msg: 'The user does not exist.' }, status: 406
    end
    #else
    #  render json: {msg: 'Is not authenticated.' }, status: 401
    #end
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
  end

  # Setting up strict parameters for when we add account creation.
  def user_params
    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
