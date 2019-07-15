class UserController < ApplicationController
	
	# Use Knock to make sure the current_user is authenticated before completing request.
	before_action :authenticate_user,  only: [:index, :current, :update]
	before_action :authorize_as_admin, only: [:destroy]
	before_action :authorize,          only: [:update]

	# Should work if the current_user is authenticated.
	def index
		render json: {msg: 'Logged-in'}, status: 201
	end

	# Call this method to check if the user is logged-in.
	# If the user is logged-in we will return the user's information.
	def current
		current_user.update!(last_login: Time.now)
		if(current_user != nil)
			render json: current_user, status: 202
		else
			render json: { msg: 'No hay una sesion activa actualmente'}, status: 406
		end
	end

	# Method to create a new user using the safe params we setup.
	# POST /signup/user/create
	def create
		user = User.new(user_params)
	  	if user.save
	    	render json: {id: user.id, name: user.name, last_name: user.last_name, username: user.username, email: user.email}, status: 201
	    else
	    	render json: user.errors , status: 406
	  	end
	end

	# Method to update a specific user. User will need to be authorized.
	def update
	  	user = User.find(params[:id])
	  	if user.update(user_params)
	    	render json: { msg: 'User details have been updated.' }, status: 200
	  	end
	end

	# Method to delete a user, this method is only for admin accounts.
	def destroy
	  	user = User.find(params[:id])
	  	if user.destroy
	    	render json: { msg: 'User has been deleted.' }, status: 200
	  	end
	end	
	# method that show all users
  	# GET /signup/users
	def show_all
		user = User.all
		render json: { total: user.size(), list: user.select(:uuid, :username, :name, :last_name, :email) }, status: 202
	end 

	# GET /signup/user_id
	def show_user_by_id
		user = User.find_by(uuid: params[:id])
		if user!=nil
			render json: {id: user.uuid, name: user.name, last_name: user.last_name, username: user.username, email: user.email}, status: 200
		else
			render json: {msg: 'The user does not exist.' }, status: 406
		end
	end

	# GET /signup/user_email
	def show_user_by_email
		user = User.find_by(email: params[:email])
		if user!=nil
			render json: {id: user.id, name: user.name, last_name: user.last_name, username: user.username, email: user.email}, status: 200
		else
			render json: {msg: 'The user does not exist.' }, status: 406
		end
	end  

	private

	# Setting up strict parameters for when we add account creation.
	def user_params
		params.permit(:name, :last_name, :username, :email, :password, :password_confirmation)
	end

	# Adding a method to check if current_user can update itself. 
	# This uses our UserModel method.
	def authorize
		return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
	end
end
