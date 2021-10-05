Rails.application.routes.draw do
  get 'searchs/search'
  root to:  "homes#top"
  resources :blogs do
    get :search, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
