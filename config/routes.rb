Rails.application.routes.draw do
  root "characters#index"

  resources :characters, except: [:view] do
    resources :canons, only: [:create, :update, :destroy]
  end

  devise_for :users

end
