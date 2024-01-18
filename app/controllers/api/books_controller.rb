class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show; end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: api_book_url(@book)
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def book_params
    params.require(:book).permit(:name, :cover_photo, :author, :publisher, :publish_date)
  end
end
