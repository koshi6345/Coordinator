Rails.application.routes.draw do
  get 'notifications/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users,        except:   [:new, :create] do
    resource :relationships, only:   [:create, :destroy]
  end
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'sort' => 'posts#sort'
  resources :posts do
    resources :comments,      only:   [:create, :destroy]
    resource  :favorits,      only:   [:create, :destroy]
  end
  resources :tags,          only:   [:create]
  get 'search' => 'searchs#search'
  resources :rooms,         only:   [:create, :show]
  resources :messages,      only:   [:create]
  get 'followeds/:id' => 'users#followeds', as: 'followeds'
  get 'followers/:id' => 'users#followers', as: 'followers'
  resources :notifications, only:   [:index, :update]
end
