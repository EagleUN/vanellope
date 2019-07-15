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
        #:host => "35.206.86.140",
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
        #:host => "35.206.86.140",
        :port => 389,
        :auth => {
          :method => :simple,
          :dn => "cn=#{@email},ou=eagleun,dc=arqsoft,dc=unal,dc=edu,dc=co",
          :password => @password
        }
      )
      return ldap.bind
    end

    def login 
      if connect()
        if connectUser()
          user = User.find_by(email: @email)
            if user!=nil
              if user.valid?(@password)
                puts("User authentication success")
                return 1
              else
                puts("Error user authentication base datos")
                return 2
              end
            else
                puts("Error user authentication base datos")
                return 2
            end
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