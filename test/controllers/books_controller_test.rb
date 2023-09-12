require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @book = books(:other)
    @book.save
  end

  test "show button if logged" do
    get book_path(@book)
    assert_template 'books/show'
    log_in_as(@user)
    get book_path(@book)
    assert_select 'a.button', "この本を読み始める"
  end
end
