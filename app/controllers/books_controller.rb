class BooksController < ApplicationController
  include Shoshi
  def index
    @books = Book.all
    # hello = Shoshi.hello()
  end

  def show
    @book = Book.find(params[:id])
    @goals = @book.goals

    @now_reading = now_reading? ? true : false
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    shoshi = Shoshi.get_shoshi(@book.isbn)
    set_book_info(shoshi)
    if @book.save
      redirect_to books_path
    else
      render 'users/new'
    end
  end

  private
  def book_params
    params.require(:book).permit(:isbn)
  end

  def set_book_info(shoshi)
    @book.title = shoshi[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
    @book.author = shoshi[0]["onix"]["DescriptiveDetail"]["Contributor"][0]["PersonName"]["content"]
  end

  def now_reading?
    if current_user == nil
      false
    else
      current_user.books.include?(@book)
    end
  end
end
