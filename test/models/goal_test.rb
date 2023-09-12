require "test_helper"

class GoalTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @book = books(:bible)
    @goal = @user.goals.build(user_id: @user.id, book_id: @book.id, date: 3.years.ago)
  end

  test "user id should be presence" do
    @goal.user_id = nil
    refute @goal.valid?
  end

  test "save should se" do
    assert_difference 'Goal.count', 1 do
      @goal.save
    end
  end

  test "order should be" do
    @goal = goals(:goal2)
    @recent_goal = Goal.first
    assert_equal @goal, @recent_goal
  end
end
