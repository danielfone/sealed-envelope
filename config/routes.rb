Rails.application.routes.draw do
  root to: 'envelopes#new'
  resources :envelopes, except: :index do
    resources :seals, only: :create
  end
  resources :seals do
    post :opening
    get :contents
  end
end
