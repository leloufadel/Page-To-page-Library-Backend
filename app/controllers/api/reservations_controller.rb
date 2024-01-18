class Api::ReservationsController < ApplicationController
  def index
    @reservations = User.reservations.build
    render json: @reservations
  end

  def create; end

  private

  def reserveation_params
    params.require(:reservation).permit(:date, :due_date, :city)
  end
end
