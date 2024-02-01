require 'rails_helper'

RSpec.describe User, type: :model do
  before(:example) do
    @user = User.create(name: 'user', email: 'user@mail.com', password: '654321')
  end
  it 'valid with a name and a valid posts_counter' do
    expect(@user).to be_valid
  end

  it 'It is not valid without a name' do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  describe 'admin?' do
    it 'returns true if the user is an admin' do
      admin_user = User.create(name: 'user1', email: 'user1@mail.com', password: '654321', role: 'admin')
      expect(admin_user.admin?).to be_truthy
    end

    it 'returns false if the user is not an admin' do
      regular_user = User.create(name: 'user2', email: 'user2@mail.com', password: '654321', role: 'user')
      expect(regular_user.admin?).to be_falsy
    end
  end
end
