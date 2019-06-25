require 'net/ldap'
class Ldap
    def initialize(email, password)
      @email = email
      @password = password
      puts("email:  #{email} password: #{password}")
    end
  
    def connect
      ldap = Net::LDAP.new(
        :host => "eagleun-ldap",
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
        :host => "eagleun-ldap",
        :port => 389,
        :auth => {
          :method => :simple,
          :dn => "cn=#{@email},ou=eagleun,dc=arqsoft,dc=unal,dc=edu,dc=co",
          :password => @password
        }
      )
      #puts("username: #{username}")
      return ldap.bind
    end

    def login 
      if connect()
        if connectUser()
          user = User.find_by(email: @email)
            if user!=nil
              if user.valid?(@password)
                puts("User authentication success")
              else
                puts("Error user authentication base datos")
              end
            end
          return 1
        else
          puts("Error user authentication ldap")
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
  