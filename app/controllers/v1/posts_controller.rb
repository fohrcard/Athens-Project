class V1::PostsController < V1::ApplicationController
  before_action :authenticate_request!
  
  def index
    render json: current_user.posts.as_json, status: 200
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      render json: post.as_json, status: :created
    else
      render json: {error_message: post.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: post.as_json, status: 200
  end

  def flag
    post = Post.find(params[:post_id])

    # Update user flag count
    user = post.user
    user.increment(:flag, by = 1)
    user.save

    # Destroy posts
    post.destroy

    render json: post.as_json, status: 200
  end

  private
    def post_params
      params.permit(:image_one, :image_two)
    end
end
