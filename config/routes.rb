Rails.application.routes.draw do
  get 'sponsored_posts/show'

  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

  resources :questions

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts
    resources :users, only: [:new, :create]
  end

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
