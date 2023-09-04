class BooksController < ApplicationController
  include Shoshi
  def index 
    @books = Book.all
    # hello = Shoshi.hello()
  end

  def new 
    @book = Book.new
    @isbn = ""
    # @json = Shoshi.get_shoshi(@isbn)
  end

  def create
    @book = Book.new(book_params)
    # 同じisbnが登録済みか
    if Book.find_by(isbn: @book.isbn) == nil 
      # 書誌情報を持ってきて、モデルに登録する
      shoshi_json = Shoshi.get_shoshi(@book.isbn)
      @book.title = shoshi_json[0]["onix"]["DescriptiveDetail"]["TitleDetail"]["TitleElement"]["TitleText"]["content"]
    else
      flash[:alert] =  "他の誰かがすでに読み始めているようです"
      redirect_to new_book_path and return
    end
    
    @book.save
    redirect_to books_path
  end

  private
  def book_params 
    params.require(:book).permit(:isbn)
  end
end


