Rails.application.routes.draw do
  get 'sessions/index'
  post 'sessions/index'
  resources :users
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :tasks
      post 'create_test', to: 'tasks#create_test'
    end
  end
end
