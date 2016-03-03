Rails.application.routes.draw do

  resources :questions

  resources :topics do
    resources :posts, except: [:index] 
  end

    resources :posts, only: [] do

      resources :comments, only: [:create, :destroy]
    end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'
  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"
  get "welcome/faq"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :advertisements
  root to: 'welcome#index'
end
