class V1::ApplicationController < ActionController::API
  before_action :ensure_json_request
  def ensure_json_request
    return if request.format == :json
    render json: {}, status: 406
  end

end
