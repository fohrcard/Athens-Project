require 'rails_helper'

RSpec.describe V1::TestController, :type => :controller do
  describe "GET #test" do
    it "responds successfully with an HTTP 200 status code" do
      get :test, { :format => :json }
      expect(response).to have_http_status(200)
    end
    it "should by pass the before actions", :skip_before do
      get :test, { :format => :json }
      expect(response).to have_http_status(401)
    end
  end
end
