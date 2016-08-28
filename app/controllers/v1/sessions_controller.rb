class V1::SessionsController < V1::ApplicationController
  def create
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user.present?
      render json: payload(user), status: 200
    else
      render json: {error_message: ['Invalid Username/Password']}, status: :unauthorized
    end
  end


  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: ::JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end
