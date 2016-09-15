class V1::RegistrationsController < V1::ApplicationController
  def create
    user = User.new(registration_params)
    if user.save
      render json: User.payload(user), status: :created
    else
      render json: {error_message: user.errors}, status: :unprocessable_entity
    end
  end

  private
    def registration_params
      params.permit(:email,:password,:password_confirmation)
    end
end
