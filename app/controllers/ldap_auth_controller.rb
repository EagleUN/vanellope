class LdapAuthController < ApplicationController
    def connect
      if ldap.connect() 
        puts(ldap.connection.get_operation_result.message)
        if ldap.connectUser()
            #le pido autenticar como shris lo hace si si 
            puts("Autenticacion satisfactoria")
            #else 
            #puts("el usuario no existe en la base de datos")
        else
            puts("el usuario no existe en el LDAP")
        end
      else
        flash[:error] = ldap.connection.get_operation_result.message
      end
    end
  
    private
  
    def ldap
      @ldap ||= Ldap.new(params[:email], params[:password])
    end
end