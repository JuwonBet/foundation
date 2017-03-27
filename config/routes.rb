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
  resources :banks, :user_packages
  devise_for :users, controllers: { registrations: 'user/registrations' }

  get '/contact', to: 'contacts#new'
  post '/contact', to: 'contacts#create'

  authenticate :user do
  	namespace :user do
      #get '/user_packages', to: 'user_packages#index'
  		get '/dashboard', to: 'dashboard#index'
      get '/banks/list', to: 'banks#list'
      get '/match/uplink', to: 'matches#get_up_link_matches'
      get '/match/downlink', to: 'matches#get_down_link_matches'
      get '/confirm/proof', to: 'confirm_proof#index'
      get '/confirm_proof/verify/:id', to: 'confirm_proof#confirm_proof'
      get '/confirm/proof/download/:id', to: 'confirm_proof#download_proof_file'
      get '/confirm_proof/list/unconfirmed', to: 'confirm_proof#get_unconfirmed_proof_uploads'

      resources :banks, :packages, :upload_proof, :confirm_proof
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
