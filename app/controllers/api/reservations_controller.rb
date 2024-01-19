class Api::ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations
    render json: @reservations
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.build(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created, location: api_reservation_url(@reservation)
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :due_date, :city)
  end
end
