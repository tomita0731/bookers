class BooksController < ApplicationController
  
  
  def create
    @book = Book.new(list_params)
    if @book.save
     flash[:notice] = "Book was successfully created."
     redirect_to book_path(@book)
    else
      @books= Book.all
      render :index
    end
  end
  
  
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
   
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(list_params)
      flash[:notice] = "Books successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
     if book.destroy
     flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
     end
  end
  


private
  def list_params
    params.require(:book).permit(:title, :body)
  end
  
end
