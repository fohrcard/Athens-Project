Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json }, path: '/api/v1' do
    get 'test', to: "test#test"
    post 'token/create', to: "registrations#create"
    post 'token', to: "sessions#create"
  end
end
