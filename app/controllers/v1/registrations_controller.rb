class V1::RegistrationsController < V1::ApplicationController
  def create
    email = "#{Digest::SHA1.hexdigest([Time.now, rand].join)}@fohr-athens.com"
    password = SecureRandom.urlsafe_base64
    user = User.new(email: email,
                    password: password,
                    password_confirmation: password,
                    name: SecureRandom.urlsafe_base64)

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
