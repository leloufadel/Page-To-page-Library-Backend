class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find_by(id: params[:id])
    
    if @book
      render json: @book, status: :ok
    else
      render json: { message: 'Book not found' }, status: :bad_request
    end
  end

  def create; end

  def destroy
    @books = Book.find_by(id: params[:id])

    if @books.destroy
      render json: { message: 'Book Was deleted successfully' }, status: :ok
    else
      render json: { message: 'Something went wrong'}, status: :not_found
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :cover_photo, :author, :publisher, :publish_date)
  end
end
