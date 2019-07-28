Rails.application.routes.draw do

  resources :drivers
  resources :agencies
  devise_for :users   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  namespace :admin do
    resources :drivers
    resources :agencies
    resources :users
    get 'dashboard'  => 'sites#dashboard'
  end  
  get '/search_drivers' => "home#search_drivers"

end
