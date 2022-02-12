Rails.application.routes.draw do
  devise_for :users
  resources :boards do
    resources :columns do
      resources :tasks
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
