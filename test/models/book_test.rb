require "test_helper"

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "my book", author: "me", isbn: "9999")
  end

  test "title should be presence" do
    @book.title = "  "
    refute @book.valid?
  end

  test "isbn should be unique" do 
    dupliate_book = @book.dup 
    @book.save
    refute dupliate_book.valid?
  end
end
