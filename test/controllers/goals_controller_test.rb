require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @book = books(:bible)
  end
  test "the truth" do
    assert true
  end

  test "should login" do
    get new_user_goal_path(@user)
    assert_redirected_to login_url
    post user_goals_path(@user)
    assert_redirected_to login_url
  end

  test "redirect if there is not therails  book" do
    log_in_as(@user)
    post user_goals_path(@user), params: {
      goal: {
        "date(1i)": "9999",
        "date(2i)": "9",
        "date(3i)": "9",
        isbn: "9999",
      }
    }
    assert_redirected_to new_book_path
  end

  test "redirect to current_user when saved" do
    log_in_as(@user)

    assert_difference 'Goal.count', 1 do
      post user_goals_path(@user), params: {
        goal: {
          "date(1i)": "9999",
          "date(2i)": "9",
          "date(3i)": "9",
          isbn: @book.isbn,
        }
      }
    end

    assert_redirected_to user_path(@user)
  end
end
