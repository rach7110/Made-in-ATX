TechInAustin::Application.routes.draw do
  resources :companies


  devise_for :users

root to: "companies#index"
end
