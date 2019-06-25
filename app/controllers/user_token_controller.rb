require "#{Rails.root}/lib/ldap"

class UserTokenController < Knock::AuthTokenController
	skip_before_action :verify_authenticity_token


	def create
      if check==1
      	render json: {jwt: auth_token.token}, status: :created
      else
      	render json: {jwt: nil}, status: :created
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
      #puts ( "email: #{params[:email]} password: #{ params[:password]}")
      @ldap = Ldap.new(params[:email], params[:password])
    end
end