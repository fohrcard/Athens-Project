class V1::RegistrationsController < V1::ApplicationController
  def create
    user = User.new(registration_params)
    if user.save
      render json: payload(user), status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private
    def registration_params
      params.permit(:email,:password,:password_confirmation)
    end

    def payload(user)
      return nil unless user and user.id
      {
        auth_token: JsonWebToken.encode({user_id: user.id}),
        user: {id: user.id, email: user.email}
      }
    end
end
