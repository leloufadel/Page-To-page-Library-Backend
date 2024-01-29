require 'rails_helper'

RSpec.describe 'Users::Registrations', type: :request do
  describe 'POST /users' do
    context 'when registration is successful' do
      it 'responds with success JSON' do
        post '/users', params: { user: { name: 'User', password: '654321', email: 'user@gmail.com' } }, as: :json
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Signed up sucessfully.')
      end
    end
    context 'when registration fails' do
      it 'responds with unprocessable_entity JSON' do
        post '/users', params: { user: nil }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Something went wrong.')
      end
    end
  end
end
