class Ldap
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    def connect
      ldap = Net::LDAP.new(
        :host => "35.232.95.82",
        :port => 389,
        :auth => {
          :method => :simple,
          :dn => "cn=admin,dc=arqsoft,dc=unal,dc=edu,dc=co",
          :password => "admin"
        }
      )
      return ldap.bind
    end

    def connectUser
      ldap = Net::LDAP.new(
        :host => "35.232.95.82",
        :port => 389,
        :auth => {
          :method => :simple,
          :dn => "cn=#{username}+,ou=eagle,dc=arqsoft,dc=unal,dc=edu,dc=co",
          :password => @password
        }
      )
      return ldap.bind
    end

    def login 
      if connect()
        if connectUser()
          puts("User authentication success")
          return 1
        else
          puts("Error user authentication")
          return 0
        end
      else
        puts("Error when connecting to LDAP")
        return -1
      end
    end

    def username
      "#{@email.split("@").first}"
    end
end
  