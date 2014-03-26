Vicetracker::Application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :vices do
    resources :subvices, shallow: true do
      resources :purchases, shallow: true
    end
  end


  root 'vices#index'

end
