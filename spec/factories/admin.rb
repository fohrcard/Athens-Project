FactoryGirl.define do
  factory :admin_user, :class => 'Admin::User' do

  end
  factory :admin_api_client_token, :class => 'Admin::Api::ClientToken' do
    access_token nil
    email "email@test.com"
    url "fohrcard.com"
    scopes { [:admin] }
  end


end
