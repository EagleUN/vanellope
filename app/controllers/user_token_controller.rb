require "#{Rails.root}/lib/ldap"

class UserTokenController < Knock::AuthTokenController
	skip_before_action :verify_authenticity_token
	skip_before_action :authenticate
	
	# GET /users/log_in
	# temporal solo para inicio de sessionchimbo"
	def showU
		if check==1
      	response.headers['Authorization'] = "Bearer #{auth_token.token}"
      	render json: {jwt: auth_token.token, id: entity.id, session: true}, status: 201
      else
      	render json: {jwt: "0", id: "0", session: false}, status: 401
      end
	end

	def create
      if check==1
      	response.headers['Authorization'] = "Bearer #{auth_token.token}"
      	render json: {jwt: auth_token.token, id: entity.id}, status: 201
      else
      	render json: {jwt: "0", id: "0"}, status: 401
      end
	end

	def check
		return ldap.login()
	end

	private

    def auth_params
      params.permit(:email, :password)
	end

	def ldap
      @ldap = Ldap.new(params[:email], params[:password])
    end
end