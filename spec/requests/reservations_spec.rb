# spec/requests/api/reservations_spec.rb
require 'rails_helper'

RSpec.describe 'Api::ReservationsController', type: :request do
  before(:example) do
    @user = User.create(id: 1, name: "User", password: "654321", email: "user@gmail.com")
    @book1 = Book.create(id: 1, name: 'The Doctor', cover_photo: 'test2.png', author: 'THE Medic', publisher: 'One', publish_date: '2021-01-01', category: 'Fiction', info: 'This is a testing side of info')
    @book2 = Book.create(id: 2, name: "The Magician", cover_photo: "test3.png", author: "THE Writer", publisher: "One", publish_date: "2021-01-01", category: "Fiction", info: "This is a testing side of info")
    @reservation = Reservation.create(id: 1, date: "2000-10-19", due_date: "2000-10-29", city: "Caracas", user: @user)
    @book_reservation1 = BookReservation.create(book: @book1, reservation: @reservation)
    @book_reservation2 = BookReservation.create(book: @book2, reservation: @reservation)
  end
  describe 'GET /api/reservations?user_id=id' do
    it 'returns a list of reservations for a user' do
      get "/api/reservations?user_id=#{@user.id}"  
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST/api/reservations?user_id=id' do
    it 'creates a new reservation' do  
      post "/api/reservations?user_id=#{@user.id}", params: { reservation: {reservation_id: @reservation.id}, book_ids: [@book1.id, @book2.id] } 
      expect(response).to have_http_status(:created)
      # expect(JSON.parse(response.body)['date']).to eq(@reservation.date)
    end

    it 'returns errors for invalid reservation creation' do
      post "/api/reservations?user_id=#{@user.id}", params: { reservation: { date: '' }, book_ids: [@book1.id, @book2.id] } 
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to have_key('date')
    end
  end

end
