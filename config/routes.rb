Rails.application.routes.draw do
  root to: 'home#new'
  resource :home, controller: :home, only: [:new, :create]
end
