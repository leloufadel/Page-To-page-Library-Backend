class MembersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :update_role

  def show
    user = gt_user_from_token
    render json: {
      message: "If you see this, you're in!",
      user:
    }
  end

  def update_role
    user = gt_user_from_token
    if user.role == 'admin'
      user_update = User.find_by(email: params[:email])
      user_update.update(role: 'admin')
      render json: { message: 'Successfully updated user role' }, status: :ok
    else
      render json: { message: 'Unauthorized user' }, status: :unauthorized
    end
  end

  private

  def gt_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split[1],
                             ENV.fetch('DEVISE_JWT_SECRET_KEY', nil)).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end
end
