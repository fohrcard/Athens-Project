class V1::SessionsController < V1::ApplicationController
  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user.present?
      render json: User.payload(user), status: 200
    else
      render json: {error_message: ['Invalid Username/Password']}, status: :unauthorized
    end
  end
end
