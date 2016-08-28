class V1::TestController < V1::ApplicationController
  before_action :authenticate_request!

  def test
    render json: {test: "Test"}, status: 200
  end
end
