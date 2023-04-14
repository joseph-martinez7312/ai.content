Rails.application.routes.draw do
  resources :contents do
    member do
      post :generate
    end
  end
  resources :content_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
