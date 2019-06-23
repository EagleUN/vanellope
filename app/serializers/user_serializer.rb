class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :last_name, :email, :username, :role, :created_at, :updated_at, :last_login
end
