require "#{Rails.root}/lib/ldap"

class UserTokenController < Knock::AuthTokenController
	skip_before_action :verify_authenticity_token
	skip_before_action :authenticate

	def create
      if check==1
      	response.headers['Authorization'] = "Bearer #{auth_token.token}"
      	render json: {jwt: auth_token.token, id: entity.id}, status: 201
      else
      	render json: {jwt: "0", id: "0"}, status: 401
      end
	end

	def entity
	  user = User.find_by(username: params[:email])
	  if user!=nil
	  	params[:email] = user.email
	  end
      @entity ||=
        if entity_class.respond_to? :from_token_request
          entity_class.from_token_request request
        else
          entity_class.find_by email: auth_params[:email]
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
	  user = User.find_by(username: params[:email])
	  if user!=nil
	  	params[:email] = user.email
	  end
      @ldap = Ldap.new(params[:email], params[:password])
    end
end