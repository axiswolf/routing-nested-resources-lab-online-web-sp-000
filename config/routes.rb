Rails.application.routes.draw do
  resources :artists, only: [:show] do
    resources :songs, only: [:show, :index]
  end
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

end
