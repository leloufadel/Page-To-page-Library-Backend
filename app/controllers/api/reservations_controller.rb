class Api::ReservationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.includes(:books)
    render json: @reservations.as_json(include: :books)
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = @user.reservations.build(reservation_params)
    if @reservation.save
      params[:book_ids].each do |book_id|
        BookReservation.create(book_id:, reservation_id: @reservation.id)
      end
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
