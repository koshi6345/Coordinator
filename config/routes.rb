Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,         only:   [:show, :edit, :update] do
    resource :relationships, only:   [:create, :destroy]
  end
  root to: 'posts#index'
  get 'sort' => 'posts#sort'
  resources :posts,         except: [:index] do
    resources :comments,      only:   [:create, :destroy]
    resource  :favorits,      only:   [:create, :destroy]
  end
  resources :tags,          only:   [:create]
  get 'search' => 'searchs#search'
  resources :rooms,         only:   [:create, :show]
  resources :messages,      only:   [:create]
end
