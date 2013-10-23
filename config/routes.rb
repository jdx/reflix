Reflix::Application.routes.draw do
  get "/search" => "movies#search"
  resources :movies
  root to: "movies#index"
end
