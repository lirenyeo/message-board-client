Rails.application.routes.draw do
  resources :messages, only: [:index, :create]
  post '/messages/delete/:id' => 'messages#destroy'
end
