class BooksController < ApplicationController
  
  
  def create
    book = Book.new(list_params)
    book.save
    redirect_to book_path(book)
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(list_params)
    redirect_to book_path(book)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book)
  end
  


private
  def list_params
    params.require(:book).permit(:title, :body)
  end
  
end
