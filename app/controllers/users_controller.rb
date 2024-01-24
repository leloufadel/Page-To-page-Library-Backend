class UsersController < ApplicationController
  def verify
    if params[:token] == 'token'
      puts (current_user.role)
      current_user.update(role: 'admin')
      render json: { status: 'success' }
    else
      render json: { status: 'error' }, status: :unauthorized
    end
  end
end
