TechInAustin::Application.routes.draw do
  resources :companies


  devise_for :users
end
