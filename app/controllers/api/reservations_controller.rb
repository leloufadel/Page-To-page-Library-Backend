class Api::ReservationsController < ApplicationController
  def index
    @reservations = User.reservations.build
    render json: @reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: @reservation, status: :created, location: api_reservation_url(@reservation)
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reserveation_params
    params.require(:reservation).permit(:date, :due_date, :city)
  end
end
