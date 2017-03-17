Rails.application.routes.draw do
  resources :messages
  devise_for :admins
	root to: "pages#index"
	 get "/ideologies" => 'pages#ideologies'
   get "/about" => 'pages#about'
   get "/faq" => 'pages#faq'
   get "/terms_and_conditions" => 'pages#terms_and_conditions'
   get "/privacy_policy" => 'pages#privacy_policy'
   get "/packages" => 'pages#packages'
  resources :banks
  devise_for :users, controllers: { registrations: 'user/registrations' }

  get '/contact', to: 'contacts#new'
  post '/contact', to: 'contacts#create'

  authenticate :user do
  	namespace :user do
  		get '/dashboard', to: 'dashboard#index'
  		resources :banks
  	end
  end

  authenticate :admin do
  	namespace :admin do
  		get '/dashboard', to: 'dashboard#index'
  		resources :users
      resources :matches, only: [:new, :create, :index]
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
