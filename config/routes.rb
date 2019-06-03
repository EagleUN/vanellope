Rails.application.routes.draw do
	get 'welcome/index'
	root 'welcome#index'

	#devise_for :users, skip: [:sessions, :registrations, :passwords]
	devise_for :users, controllers: {sessions: 'users/sessions'}

	devise_scope :user do
	  # sessions
	  post   '/log/user/in',  to: 'users/sessions#create'
	  delete '/log/user/out', to: 'users/sessions#destroy'
	  #get    'login',  to: 'devise/sessions#new',     as: :new_user_session
	  #post   'login',  to: 'devise/sessions#create',  as: :user_session
	  #delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
	  # registrations
	  #put    '/account',  to: 'devise/registrations#update'
	  #delete '/account',  to: 'devise/registrations#destroy'
	  post   '/signup/user/create',  to: 'users/registrations#create'
	  get   '/signup/user_id',  to: 'users/registrations#show'
	  get   '/signup/user_email',  to: 'users/registrations#show_user_by_email'
	  get   '/signup/users',  to: 'users/registrations#show_all'
	  patch  '/signup/user',  to: 'users/registrations#update'
	  delete '/signup/user',  to: 'users/registrations#destroy_user'
	  #get    '/register', to: 'devise/registrations#new',    as: :new_user_registration
	  #get    '/account',  to: 'devise/registrations#edit',   as: :edit_user_registration
	  #patch  '/account',  to: 'devise/registrations#update', as: :user_registration
	  #get    '/account/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration# passwords 
	  # passwords
	  #get   'new-pass',  to: 'devise/passwords#new',    as: :new_user_password
	  #get   'edit-pass', to: 'devise/passwords#edit',   as: :edit_user_password
	  #patch 'edit-pass', to: 'devise/passwords#update', as: :user_password
	  #post  'new-pass',  to: 'devise/passwords#create', as: :user_password
	end
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
