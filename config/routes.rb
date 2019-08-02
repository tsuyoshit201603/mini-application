Rails.application.routes.draw do
  resources :articles do
    resources :users
  end
end
