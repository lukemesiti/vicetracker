Vicetracker::Application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :vices do
    resources :subvices, shallow: true do
      resources :purchases, shallow: true
    end
  end

  resources :inquiries, :only => [:new, :create] do
    get 'thank_you', :on => :collection
  end

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  authenticated :user do
    root :to => 'vices#index', :as => "authenticated_root"
  end
 
  root :to => 'pages#home'
end
