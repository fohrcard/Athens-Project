Rails.application.routes.draw do

  namespace :v1, defaults: { format: :json }, path: '/api/v1' do
    get 'test', to: "test#test"
    post 'signup', to: "registrations#create"
    post 'login', to: "sessions#create"
    resources :users, only: :index, path: "user"
    get "user/requests", to: "users#requests"
    resources :posts, only: [:index, :create, :destroy], path: "post" do
      post "/flag", to: "posts#flag"
      post "vote/:image_number", to: "posts#vote"
    end
  end
end
