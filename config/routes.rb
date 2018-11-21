Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants do
    resources :reviews, only: %i[index new create]
  end
  resources :reviews, only: %i[show edit update destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
