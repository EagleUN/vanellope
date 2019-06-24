require "#{Rails.root}/lib/ldap"
class LdapAuthController < ApplicationController
    def connect
      if ldap.connect() 
        #puts(ldap.connect.get_operation_result.message)
        if ldap.connectUser()
            #le pido autenticar como shris lo hace si si 
            puts("Autenticacion satisfactoria")
            #else 
            #puts("el usuario no existe en la base de datos")
        else
            puts("el usuario no existe en el LDAP")
        end
      else
        flash[:error] = ldap.connect.get_operation_result.message
      end
    end
  
    private
  
    def ldap
      #puts ( "email: #{params[:email]} password: #{ params[:password]}")
      @ldap = Ldap.new(params[:email], params[:password])
    end
end

