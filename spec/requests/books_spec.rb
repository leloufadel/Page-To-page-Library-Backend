# spec/requests/api/books_spec.rb
require 'rails_helper'

RSpec.describe 'Api::BooksController', type: :request do
    before(:example) do
        @book = Book.create( name: 'The Doctor',
                             cover_photo: 'test2.png',
                             author: 'THE Medic',
                             publisher: 'One',
                             publish_date: '2021-01-01',
                             category: 'Fiction',
                             info: 'This is a testing side of info')
       end
  describe 'GET /api/books' do
    it 'returns a list of books' do
      get '/api/books'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).not_to be_empty
    end
  end

  describe 'GET /api/books/:id' do
    it 'returns a single book' do
      get "/api/books/#{@book.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).to eq(@book.name)
    end

    it 'returns an error for non-existing book' do
      get '/api/books/2'
      expect(response).to have_http_status(:bad_request)
      expect(JSON.parse(response.body)['message']).to eq('Book not found')
    end

    it 'returns errors for invalid book creation' do
      post '/api/books', params: { book: { name: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to have_key('name')
    end
  end

  describe 'DELETE /api/books/:id' do
    it 'deletes an existing book' do
      delete "/api/books/#{@book.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('Book Was deleted successfully')
    end

    it 'returns an error for non-existing book deletion' do
      delete '/api/books/2'
      expect(response).to have_http_status(:not_found)
      expect(JSON.parse(response.body)['message']).to eq('Book not found')
    end
  end
end
