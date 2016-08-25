class V1::RegistrationsController < V1::ApplicationController
  def create
    user = User.create(registration_params)
    render json: {code: 200, token: user.token}
  end

  private
    def registration_params
      params.permit(:email,:password)
    end
end
