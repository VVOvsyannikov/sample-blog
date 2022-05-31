Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"  

  get 'contacts/all'

  resource :contacts, only: [:new, :create], path_names: { :new => ''}
  
  resources :articles do
    resources :comments, only: [:create]
  end

  resources :articles

  #get 'home/contacts'
  #post 'home/contacts'
  #get 'contacts/new'
  #get 'home/index'
  #get 'terms' => 'pages#terms'
  #get 'about' => 'pages#about'
  #get 'contacts' => 'contacts#new'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
