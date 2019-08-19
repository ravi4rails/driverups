Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }   
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  resources :agencies, except: [:index] do
    resources :drivers
  end
  resources :contacts, only: [:new, :create]
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  namespace :admin do
    resources :drivers
    resources :agencies
    resources :users
    resources :plans
    resources :features
    get 'dashboard'  => 'sites#dashboard'
  end  
  get '/search_drivers' => 'home#search_drivers'
  get '/about' => 'static_pages#about'
  get '/services' => 'static_pages#services'
  get '/pricing' => 'static_pages#pricing'
  get '/register_plan' => 'static_pages#register_plan'
  resources :payments, only: [:create]

end
