require 'rails_helper'

RSpec.describe 'Users::Sessions', type: :request do
  before(:example) do
    @user = User.create(id: 1, name: 'User', password: '654321', email: 'user@gmail.com')
  end
  describe 'POST /users/sign_in' do
    context 'with valid credentials' do
      it 'responds with success and returns user data' do
        post '/users/sign_in', params: { user: { email: @user.email, password: @user.password } }, as: :json
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('You are logged in.')
        expect(json_response['user']['id']).to eq(@user.id)
      end
    end
    context 'with invalid credentials' do
      it 'responds with unauthorized' do
        post '/users/sign_in', params: { user: { email: 'sadaf313@example.com', password: '123456' } }, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
  describe 'DELETE /users/sign_out' do
    context 'when user is not signed in' do
      it 'responds with unauthorized' do
        delete '/users/sign_out', as: :json
        expect(response).to have_http_status(:unauthorized)
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Hmm nothing happened.')
      end
    end
  end
end
