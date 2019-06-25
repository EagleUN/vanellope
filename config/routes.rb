Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	# Home controller routes.
	root   'home#index'


	# User actions
	#sign up
	post	'/signup/user/create'	=> 'user#create'
	patch	'/signup/user'			=> 'user#update'
	delete	'/signup/user'			=> 'user#destroy'
	get 	'/signup/users'			=> 'user#show_all'
	get   	'/signup/user_id'		=> 'user#show_user_by_id'
	get   	'/signup/user_email'  	=> 'user#show_user_by_email'
	#log in
	patch   '/log/user/edit'		=> 'user#current'
	get    	'/log/user'				=> 'home#auth'
	# Get log in token from Knock
	post   	'/log/user/in'			=> 'user_token#create'
	get    	'/users'				=> 'user#index'
end
    