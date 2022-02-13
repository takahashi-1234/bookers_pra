Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "books#index"
  resources:books,only:[:create,:destroy,:show] do
    resource:favorites,only:[:create,:destroy]
    resource:comments,only:[:create,:destroy]
  end
end
