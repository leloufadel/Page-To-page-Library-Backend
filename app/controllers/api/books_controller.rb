class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show; end

  def create; end

  def destroy; end

  private

  def book_params
    params.require(:book).permit(:name, :cover_photo, :author, :publisher, :publish_date)
  end
end
