Rails.application.routes.draw do
#root 'pages#home'
root "articles#index"
 #get "/articles", to: "articles#index"
match ':controller(/:action(/:id))',:via=>:get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
