Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :users   
  resources :agencies, except: [:index] do
    resources :drivers
  end
  resources :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  namespace :admin do
    resources :drivers
    resources :agencies
    resources :users
    get 'dashboard'  => 'sites#dashboard'
  end  
  get '/search_drivers' => 'home#search_drivers'
  get '/about' => 'static_pages#about'
  get '/services' => 'static_pages#services'
end
