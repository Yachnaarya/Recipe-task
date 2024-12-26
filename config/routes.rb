Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#index"
  resources :recipes do
    resources :ingredients
    collection do
       get 'search_recipe'
       get 'listing_result'
     end
  end
  get "search", to: "search#search"

end
