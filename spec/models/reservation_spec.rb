require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:example) do
    @user = User.create(name: 'user', email: 'user@mail.com', password: '654321')
    @reservation = Reservation.create(date: '2000-10-19', due_date: '2000-10-29', city: 'Caracas', user: @user)
  end
  describe ' is' do
    it ' valid' do
      expect(@reservation).to be_valid
    end
    it ' not valid if date nil' do
      @reservation.date = nil
      expect(@reservation).not_to be_valid
    end
    it ' not valid if city lease that 3' do
      @reservation.city = 'ai'
      expect(@reservation).not_to be_valid
    end
    it ' not valid if city nil' do
      @reservation.city = nil
      expect(@reservation).not_to be_valid
    end

    it ' not valid if due_date nil' do
      @reservation.due_date = nil
      expect(@reservation).not_to be_valid
    end
  end
end
