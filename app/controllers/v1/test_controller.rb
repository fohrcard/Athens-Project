class V1::TestController < V1::ApplicationController
  def test
    render json: {test: "Test"}
  end
end
