class V1::UsersController < V1::ApplicationController
  def index
    render json: current_user.as_json, status: 200
  end

  def requests
    render json: current_user.posts_to_review.as_json, status: 200
  end
end
