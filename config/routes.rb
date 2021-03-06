Rails.application.routes.draw do
  devise_for :users

  root to: 'dashboard#index'

  resources :questions, except: [:index]
  resources :answers, except: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
