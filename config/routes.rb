Rails.application.routes.draw do
  root 'posts#index', constraints: -> (r) { !r.session[:user_id].blank? }
  root 'welcome#index', as: :anonymous_root

  resources :users, only: [:create]
  resources :posts, only: [:index, :create, :destroy]

  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy'
end
