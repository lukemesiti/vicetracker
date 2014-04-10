class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

Vicetracker::Application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :vices do
    resources :subvices, shallow: true do
      resources :purchases, shallow: true
    end
  end

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

  # constraints(AuthConstraint.new) do
    # root :to => 'vices#index'
  # end
 
  root :to => 'pages#home'

end
