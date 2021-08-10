Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,         only:   [:show, :edit, :update]
  root to: 'posts#index'
  resources :posts,         except: [:index] do
    resources :comments,      only:   [:create, :destroy]
    resource  :favorits,      only:   [:create, :destroy]
  end
  resources :relationships, only:   [:create, :destroy]
  resources :tags,          only:   [:create]
  resources :searchs,       only:   [:index]
  resources :rooms,         only:   [:create, :show]
  resources :messages,      only:   [:create]
end
