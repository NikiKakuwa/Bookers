Rails.application.routes.draw do
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 #root "blogs#index"
  resources :blogs
  root :to => 'blogs#welcome'
end
