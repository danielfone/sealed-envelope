Rails.application.routes.draw do
  root to: 'envelopes#new'

  resources :envelopes, only: [:new, :create, :show] do
    resources :seals, only: [:create, :destroy]
    resource :session, only: [:new, :create, :destroy]
  end

  resources :seals, only: :show do
    post :opening
    get :contents
  end

end
