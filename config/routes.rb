Rails.application.routes.draw do
  get 'lists/new'
  get '/top' => 'homes#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  # .../lists/1や.../lists/3に該当する
  get 'lists/:id' => 'lists#show'
  get 'lists/edit'
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
