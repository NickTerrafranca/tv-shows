TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create] do
    resources :characters, only: [:new, :create, :destroy]
  end
  resources :characters, only: [:index, :show, :new, :create, :destroy]
end
