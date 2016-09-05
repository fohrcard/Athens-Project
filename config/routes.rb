Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json }, path: '/api/v1' do
    get 'test', to: "test#test"
    post 'signup', to: "registrations#create"
    post 'login', to: "sessions#create"
    resources :users, only: :index, path: "user"
  end
end
