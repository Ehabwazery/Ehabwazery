Rails.application.routes.draw do
root 'pages#home'
#root "articles#index"
get "/about", to: "pages#about"
#get "/articles/:id", to: "articles#show"
resources :articles
#match ':controller(/:action(/:id))',:via=>:get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
