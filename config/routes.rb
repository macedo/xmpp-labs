Rails.application.routes.draw do
  devise_for :users
   root 'lobby#index'
end
